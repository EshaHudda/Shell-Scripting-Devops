#!/bin/bash

# 1. Create the backup directory

BACKUP_DIR="$HOME/backup"
mkdir -p "$BACKUP_DIR"

# 2. Copy .txt files to the backup directory

for file in *.txt; 
do
	if [ -f "$file" ]; 
then

# Check if it's a regular file
# 3. Append date and time to the filename
 TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
 NEW_FILENAME="${file%.txt}_$
 {TIMESTAMP}.txt"
	 cp "$file" "$BACKUP_DIR/$NEW_FILENAME"

	 echo "Copied $file to $BACKUP_DIR/$NEW_FILENAME"
fi
done

echo "Backup process completed"


