#!/bin/bash

directory="negpod_3-q1"

# Check if directory exists, if not, create it
if [ ! -d "$directory" ]; then
    mkdir "$directory"
    echo "Directory created: $directory"
else
    echo "Directory already exists: $directory"
fi

# Move files to the directory
mv main.sh Students-list_1023.txt Select-emails.sh student-emails.txt "$directory/"

echo "Files moved successfully to $directory"
