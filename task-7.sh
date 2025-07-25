#!/bin/bash

read -p "Enter file name: " file

if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

lines=$(wc -l < "$file")
words=$(wc -w < "$file")
chars=$(wc -m < "$file")
longest=$(tr -s '[:space:]' '\n' < "$file" | awk '{ if (length > max) { max = length; word = $0 } } END { print word }')

echo "Lines: $lines"
echo "Words: $words"
echo "Characters: $chars"
echo "Longest word: $longest"
