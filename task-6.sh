#!/bin/bash

input="packages.txt"
log="install_log.txt"

> "$log"

while read package; do
    if [ -n "$package" ]; then
        echo "Installing $package..."
        if sudo apt-get install -y "$package" &>/dev/null; then
            echo "$package: SUCCESS" >> "$log"
        else
            echo "$package: FAILED" >> "$log"
        fi
    fi
done < "$input"

echo "Installation complete. Check $log for details."
