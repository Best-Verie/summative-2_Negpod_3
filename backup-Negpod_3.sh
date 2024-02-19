#!/bin/bash

# Remote server details
host="64293e56bc62.3a2627c1.alu-cod.online"
username="64293e56bc62"
password="328d3b338a4ced526c9a"
remote_directory="/summative/1023-2024j"

# Backup directory
local_directory="negpod_3-q1"

# Perform backup using rsync
rsync -avz --progress -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" "$local_directory" "$username@$host:$remote_directory"

# Check if backup is successful
if sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username@$host" "[ -d \"$remote_directory/$local_directory\" ]"; then
    echo "Backup completed successfully."
else
    echo "Error: Backup failed."
fi