#!/bin/bash

# Function to select emails of students, sort them alphabetically, and save them to student-emails.txt
select_emails() {
    grep -oP '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' students-list_1023.txt | sort > student-emails.txt
    echo "Emails of students have been selected and saved to student-emails.txt (sorted alphabetically)"
}

# Call the select_emails function
select_emails