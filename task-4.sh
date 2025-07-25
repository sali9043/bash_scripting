#!/bin/bash
echo "Enter directory path to compress: "
read -p "enter path" dir

if [ ! -d "$dir" ]; then
    echo "Directory does not exist."
    exit 1
fi

date=$(date +%Y-%m-%d)
filename="backup_${date}.tar.gz"

tar -czf "$filename" "$dir"

echo "Saved compressed as $filename"
