#!/bin/bash

# Function to check if files matching a pattern exist and remove them
remove_files_if_exist() {
  local pattern="$1" # Get the pattern from the function argument

  # Use a for loop to iterate over files matching the pattern
  for file in $pattern*; do
    if [ -f "$file" ]; then
      echo "$file exists. Removing it..."
      rm "$file"
      echo "$file has been removed."
    else
      echo "No files matching the pattern '$pattern' exist."
      break # Exit the loop if no files match
    fi
  done
}

# Function to move files matching a pattern to the KDE_backup directory
move_files_to_backup() {
  local pattern="$1"               # Get the pattern from the function argument
  local backup_dir="../KDE_backup" # Define the backup directory

  # Create the backup directory if it doesn't exist
  if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
    echo "Created directory: $backup_dir"
  fi

  # Empty the backup directory
  echo "Emptying the backup directory: $backup_dir..."
  rm -f "$backup_dir"/* # Remove all files in the backup directory

  # Use a for loop to iterate over files matching the pattern
  for file in $pattern*; do
    if [ -f "$file" ]; then
      echo "Moving $file to $backup_dir..."
      mv "$file" "$backup_dir/"
      echo "$file has been moved to $backup_dir."
    else
      echo "No files matching the pattern '$pattern' exist."
      break # Exit the loop if no files match
    fi
  done
}

remove_files_if_exist "transfuse"

curl -O https://gitlab.com/cscs/transfuse/-/raw/main/transfuse

chmod u+x transfuse

./transfuse

remove_files_if_exist "transfuse"
move_files_to_backup "harshaln_transfusion_"
