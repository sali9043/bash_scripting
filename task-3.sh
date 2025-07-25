#!/bin/bash

> credentials.txt

while read username; do
    if id "$username" &>/dev/null; then
        echo "$username already exists" >> credentials.txt
    else
        password=$(openssl rand -base64 12)
        useradd -m "$username"
        echo "$username:$password" | chpasswd
        echo "$username $password" >> credentials.txt
    fi
done < user_list.txt
