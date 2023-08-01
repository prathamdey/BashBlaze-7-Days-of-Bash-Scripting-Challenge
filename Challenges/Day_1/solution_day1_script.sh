#!/bin/bash

#############################################
### Desc: Shell scripting challange day 1 ###
### Created on: 31-07-2023                ###
### Version: v1                           ###
#############################################


#Task 1
# The script comprises a series of six tasks


#Task 2
#The `echo` command is used to display messages on the terminal
echo "Challange accepted #TWSBashBlazeChallenge"


#Task 3 & 4
#Define two variables(number) and accept the input from the user. Print their sum in screen.

#Prompt the user to enter the first number
read -p "Please enter the first interger: " num1


#Prompt the user to enter the second number
read -p "Please enter the second number: " num2

#Add those two variables and store the value of the variable into another variable called 'result'
result=$((num1+num2))

#Print the sum(result) of two number
echo "The sum of the two number: " $result

#Task 5
#Print the value of the built-in variables

#$HOME prints the home directory of the current user
echo "The home directory of the current user: " $HOME

#$PWD prints the present working directory of the current user
echo "The present working directory of the current user: " $PWD

#$HOSTNAME prints the hostname of the machine
echo "The hostname of the machine: " $HOSTNAME

#$UID prints the USER ID  of the current user
echo "The user id of the current user: " $UID

#Task 6
#Prompt the user to enter the directory path
read -p "Please enter the directory name: " directory_path

#Prompt the user to enter the file extension
read -p "Please enter the file extension: " file_extension

#Prompt the user with list of all files with the specified extension in the given directory
echo "List of all files with the extension $file_extension in the given directory $directory_path"
ls $directory_path/*.$file_extension

