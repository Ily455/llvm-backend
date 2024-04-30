#!/bin/bash

# Directory to search for files
directory="/home/ubuntu/llvm-backend/llvm-project/clang/lib/Basic/Targets"

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory not found: $directory"
  exit 1
fi

# Search for files containing "RISCW" in their names
# and replace occurrences of "RISCW" with "RISCPI" within the files
find "$directory" -type f -exec sed -i 's/RISC-W/RISC-PI/g' {} +
find "$directory" -type f -exec sed -i 's/RISCW/RISCPI/g' {} +
find "$directory" -type f -exec sed -i 's/riscw/riscpi/g' {} +
find "$directory" -type f -exec sed -i 's/rirsc-w/risc-pi/g' {} +

echo "Replacement completed."
