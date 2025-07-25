#!/bin/bash

touch todo.txt

file="todo.txt"

echo "1 -View tasks"
echo "2 -Add task"
echo "3 -Remove task"
read -p "Choose: " option

if [ "$option" == "1" ]; then
    cat -n "$file"
elif [ "$option" == "2" ]; then
    read -p "Enter task: " task
    echo "$task" >> "$file"
    echo "Task added."
elif [ "$option" == "3" ]; then
    cat -n "$file"
    read -p "Task number to remove: " num
    sed -i "${num}d" "$file"
    echo "Task removed."
else
    echo "Invalid option."
fi
