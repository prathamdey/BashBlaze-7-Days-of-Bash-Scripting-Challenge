#!/bin/bash

###############################
## Desc: Day 2 challange     ##
## Date: 01/08/2023          ##
## Author: Pratham Dey       ##
## Version: v1               ##
###############################


##############################
#########  PART 1  ###########
##############################

#Prompt the user about the script
echo "Welcome to the Interactive File and Directory Explorer!"

#Write a function which shows the list of directory and files present in the current directory in a loop until the user decides to exit the explorer

function print_files_and_dirs() {
  echo "Files and Directories in the current directory:"
  ls -lh --group-directories-first | awk '{print "-",$9,"(",$5,")"}'
  echo "----------------------------------------------"
}

while true; do
  print_files_and_dirs

  read -p "Do you want to explore the current directory again? (y/n): " choice

  # Check if the user wants to exit
  if [[ $choice == "n" || $choice == "N" ]]; then
    echo "Exiting the explorer."
    break
  fi

done

#calling the function
#print_files_and_dirs



##############################
#########  PART 2  ###########
##############################

#prompt the user to enter a line of text
echo "Enter your input (press Enter without any text to exit):"



# Function to calculate character count
function calculate_character_count() {
  local input="$1"
  local char_count=${#input}
  echo "Character count: $char_count"
}


#loop validating the 'ENTER'
while true; do
  read input

  # Check if the input is empty (user pressed ENTER without any text)
  if [[ -z "$input" ]]; then
    echo "Exiting the input console."
    break
  fi

  # Process the input here (you can add your logic)
  # For example, you can display the user's input:
  echo "You entered: $input"


  #Call the character count function
  calculate_character_count "$input"

done
