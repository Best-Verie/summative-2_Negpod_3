#!/bin/bash

# Function to select emails of students and save them to student-emails.txt
select_emails() {
    grep -oP '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' students-list_1023.txt > student-emails.txt
    echo "Emails of students have been selected and saved to student-emails.txt"
}

# Call the select_emails function
select_emails