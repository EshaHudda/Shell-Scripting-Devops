#!/bin/bash

# Check if a file path is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <filepath>"
  exit 1
fi

filepath="$1"

# Check if the file exists
if [ ! -f "$filepath" ]; then
  echo "Error: File '$filepath' not found."
  exit 1
fi

# Count lines, words, and characters using 'wc'
wc_output=$(wc "$filepath")
lines=$(echo "$wc_output" | awk '{print $1}')
words=$(echo "$wc_output" | awk '{print $2}')
chars=$(echo "$wc_output" | awk '{print $3}')

# Find the longest word using 'awk'
longest_word=$(awk '{
  for (i=1; i<=NF; i++) {
    if (length($i) > max_len) {
      max_len = length($i);
      longest = $i;
    }
  }
  END { print longest }
}' "$filepath")

# Display the results
echo "Lines: $lines"
echo "Words: $words"
echo "Characters: $chars"
echo "Longest Word: $longest_word"