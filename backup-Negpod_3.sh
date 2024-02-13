#!/bin/bash

# Remote server details
remote_host="2f05c1f8800b.3be8ebfc.alu-cod.online"
remote_username="2f05c1f8800b"
remote_password="d4a1d225d0abda9549d8"
remote_directory="/summative/1023-2024j"

# Copy the directory to the remote server
scp -r negpod_3-q1 "$remote_username@$remote_host:$remote_directory"

echo "Backup completed successfully to $remote_host:$remote_directory."
