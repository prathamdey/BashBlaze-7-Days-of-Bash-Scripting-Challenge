###############################
## Desc: Day 3 challange     ##
## Date: 02/08/2023          ##
## Author: Pratham Dey       ##
## Version: v1               ##
###############################

#!/bin/bash

#define the options

options() {
        echo "Options: $0"
        echo "  -c, --create     Create a new user account."
        echo "  -d, --delete     Delete an existing user account."
        echo "  -r, --reset      Reset the password of an existing user account."
        echo "  -l, --list       List all user accounts on the system."
        echo "  -h, --help       Display this help message."
}



#####################################
##WRITE THE CREATE ACCOUNT FUNCTION##
#####################################


create_account() {
        read -p "Please enter the new username: " username
        if id $username &> /dev/null; then
                echo "'$username' is already exists in the system"
                exit 1
        fi

        sudo useradd -m -s /bin/bash "$username" &> /dev/null
        read -s -p "Please enter the password for '$username': " password
        echo "$username:$password" | sudo chpasswd
        echo "User account '$username' has been created successfully"
}




#####################################
##WRITE THE DELETE ACCOUNT FUNCTION##
#####################################


delete_account() {
        read -p "Please enter the username to delete: " username
        if ! id $username &> /dev/null; then
                echo "'$username' doesn't exists in the system"
                exit 1
        fi

        sudo userdel -r "$username" &> /dev/null
        echo "User account $username has been deleted successfully"
}

#####################################
##WRITE THE PASSWORD RESET FUNCTION##
#####################################

reset_password() {
        read -p "Enter the username to reset the password: " username
        if ! id $username &> /dev/null; then
                echo "'$username' doesn't exists in the system"
                exit 1
        fi

        read -s -p "Enter the password for '$username': " password
        echo "$username:$password" | sudo chpasswd
        echo " Password has been reset successfully for the user '$username'"
}
list_accounts() {
        echo "List of user accounts: "
        awk -F: '{printf "Username: %-15s UID: %s\n", $1, $3}' /etc/passwd
}



######################################
#########WRITE THE USE CASES##########
######################################


while [[ $# -gt 0 ]]; do
        case "$1" in
-c)
        create_account
        exit 0
        ;;
-d)
        delete_account
        exit 0
        ;;
-r)
        reset_password
        exit 0
        ;;
-l)
        list_accounts
        exit 0
        ;;
-h)
        options
        exit 0
        ;;
*)
        echo "Invalid option"
        options
        exit 1
        ;;


esac
shift
done

options
exit 1