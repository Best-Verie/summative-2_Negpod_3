#!/bin/bash

# Remote server details
host="2f05c1f8800b.3be8ebfc.alu-cod.online"
username="2f05c1f8800b"
password="d4a1d225d0abda9549d8"
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