#!/bin/bash


###############################
## Desc: Day 2 challange     ##
## Date: 01/08/2023          ##
## Author: Pratham Dey       ##
## Version: v1               ##
###############################


# Function to create a backup
function create_backup() {
  local source_dir="$1"
  local backup_dir="$2"

  # Create a date and timestamped backup folder
  local timestamp=$(date +"%Y%m%d_%H%M%S")
  local backup_folder="${backup_dir}/backup_${timestamp}"

  # Copy all files from the source directory to the backup folder
  cp -r "$source_dir" "$backup_folder"

  echo "Backup created at: $backup_folder"
}

# Function to perform rotation and keep only the last 3 backups
function perform_rotation() {
  local backup_dir="$1"

  # Get a list of all backup folders sorted by modification time (oldest to newest)
  local backup_folders=($(find "$backup_dir" -maxdepth 1 -type d -name "backup_*" | sort))

  # Check if there are more than 3 backups
  local backup_count=${#backup_folders[@]}
  if (( backup_count > 3 )); then
    local num_to_delete=$((backup_count - 3))

    # Delete the oldest backup folders to keep only the last 3
    for (( i=0; i<num_to_delete; i++ )); do
      echo "Removing backup: ${backup_folders[$i]}"
      rm -rf "${backup_folders[$i]}"
    done
  fi
}

# Main script
read -p "Enter the directory path to backup: " source_directory

# Check if the source directory exists
if [[ ! -d "$source_directory" ]]; then
  echo "Error: Source directory not found."
  exit 1
fi

# Create a backup directory if it doesn't exist
backup_directory="./backups"
mkdir -p "$backup_directory"

# Perform the backup
create_backup "$source_directory" "$backup_directory"

# Perform rotation and keep only the last 3 backups
perform_rotation "$backup_directory"