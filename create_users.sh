#!/bin/bash

# Function to generate a random password
generate_password() {
  local length=${1:-12} # Default length is 12
  local chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]"
  local password=""
  for i in $(seq 1 $length); do
    password+="${chars:$(($RANDOM % ${#chars})):1}"
  done
  echo "$password"
}

# Input and output file names
user_list="user_list.txt"
credentials_file="credentials.txt"

# Check if user list file exists
if [ ! -f "$user_list" ]; then
  echo "Error: $user_list not found."
  exit 1
fi

# Clear credentials file if it exists
> "$credentials_file"

# Read usernames from the input file and create users
while IFS= read -r username; do
  if [ -n "$username" ]; then # Skip empty lines
    password=$(generate_password)

    # Create the user (replace with your OS-specific command)
    # Example for Linux/macOS:
    sudo useradd -m "$username" 2>/dev/null # Suppress error messages

    if [ $? -eq 0 ]; then
      echo "Created user: $username"
      echo "$username:$password" >> "$credentials_file"
    else
      echo "Failed to create user: $username"
    fi
  fi
done < "$user_list"

echo "Credentials saved to $credentials_file"
