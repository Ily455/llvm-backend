#!/bin/bash

# Check if the directory argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Directory containing the files
directory="$1"

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory not found: $directory"
  exit 1
fi

# Iterate over files in the directory
for file in "$directory"/*RISCW*; do
  # Check if the file exists
  if [ -e "$file" ]; then
    # Extract the filename without the directory path
    filename=$(basename "$file")
    # Replace "RISCW" with "RISCPI" in the filename
    new_filename="${filename//RISCW/RISCPI}"
    # Rename the file
    mv "$file" "$directory/$new_filename"
    echo "Renamed: $filename -> $new_filename"
  fi
done
