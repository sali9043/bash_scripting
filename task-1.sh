#!/bin/bash
mkdir -p ./backup

timestamp=$(date +"%Y%m%d_%H%M%S")
for file in *.txt; do
    if [[ -f "$file" ]]; then
        base_name="${file%.txt}"
        cp "$file" ~/backup/"${base_name}_${timestamp}.txt"
    fi
done
