#!/bin/bash

# Define the paths to folders A and B
folderB="/home/ubuntu/llvm-backend/llvm-project-new-backend"
folderA="/home/ubuntu/llvm-backend/llvm-backend-core"

# Function to copy files and folders from folder A to folder B
copy_files() {
    local src="$1"
    local dest="$2"

    # Check if the file or folder should be ignored
    if [[ "$src" == *"/.git"* ]]; then
        return
    fi

    if [[ "$src" == *"/README.md"* ]]; then
        return
    fi

    # Copy file or folder to destination
    cp -r "$src" "$dest"
}

# Find files and folders in folder A and its subfolders
find "$folderA" -mindepth 1 | while read -r file; do
    relative_path="${file#${folderA}/}"
    dest_file="${folderB}/${relative_path}"
    if [ -d "$file" ]; then
        mkdir -p "$dest_file"
    else
        copy_files "$file" "$dest_file"
    fi
done
