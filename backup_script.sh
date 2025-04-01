#!/bin/bash

# 1. Get the directory path from the user
read -p "Enter the directory path to backup: " directory_path

# 2. Get the current date in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d)

# 3. Create the backup filename
backup_filename="backup_${current_date}.tar.gz"

# 4. Create the archive and compress it
tar -czvf "$backup_filename" "$directory_path"

# 5. Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup created successfully: $backup_filename"
else
  echo "Backup failed!"
fi