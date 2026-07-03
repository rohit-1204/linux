#!/bin/bash

echo "Enter file name:"
read file
# -f checks if the file exists and is a regular file
if [ -f "$file" ]; then
    echo "File exists."
else
    echo "File does not exist."
# fi 
fi