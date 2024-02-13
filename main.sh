#!/bin/bash

function print_menu() {
    echo "=============================================================================="
    echo "|                   ALU Student Registration System                          |"
    echo "=============================================================================="
    echo "| 1. Register Student                                                        |"
    echo "| 2. Search Student                                                          |"
    echo "| 3. View All Students                                                       |"
    echo "| 4. Update Student                                                          |"
    echo "| 5. Delete Student                                                          |"
    echo "| 6. Clear                                                                   |"
    echo "| 7. Menu                                                                    |"
    echo "| 8. Exit                                                                    |"
    echo "=============================================================================="
}

function register_student() {
    local email; local age; local student_id
    read -r -p "Enter student email: " email
    read -r -p "Enter student age: " age
    read -r -p "Enter student ID: " student_id
    number_regex='^[0-9]+$'
    email_regex='^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    if [ -f students-list_1023.txt ] && [[ $(grep -c "$email" students-list_1023.txt) -gt 0 ]]; then
      printf "\nStudent already exists\n"
    elif [ -z "$email" ] || [ -z "$age" ] || [ -z "$student_id" ]; then
      printf "\nAll fields are required\n"
    elif ! [[ $age =~ $number_regex ]] ; then
      printf "\nAge must be a number\n"
    elif ! [[ $email =~ $email_regex ]] ; then
      printf "\nInvalid email\n"
    else
        echo "$email:$age:$student_id" >> students-list_1023.txt
        printf "\nStudent registered successfully\n"
    fi
}

function deleteStudent(){
    local id
    read -r -p "Enter student id: " id
    if [ -f students-list_1023.txt ] && [[ $(grep -c "$id" students-list_1023.txt) -gt 0 ]]; then
        sed -i "/$id/d" students-list_1023.txt
        printf "\nStudent deleted successfully\n"
    else
        printf "\nStudent not found\n"
    fi
}

function update_student() {
    local student_id
    read -r -p "Enter student ID to update: " student_id

    if [ -f students-list_1023.txt ] && grep -q "$student_id" students-list_1023.txt; then
        local email; local age
        read -r -p "Enter updated email: " email
        read -r -p "Enter updated age: " age
        number_regex='^[0-9]+$'
        email_regex='^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
        if [ -z "$email" ] || [ -z "$age" ]; then
            printf "\nAll fields are required\n"
        elif ! [[ $age =~ $number_regex ]]; then
            printf "\nAge must be a number\n"
        elif ! [[ $email =~ $email_regex ]]; then
            printf "\nInvalid email\n"
        else
            sed -i "/$student_id/c\\$email:$age:$student_id" students-list_1023.txt
            printf "\nStudent with ID %s updated successfully\n" "$student_id"
        fi
    else
        printf "\nStudent with ID %s not found\n" "$student_id"
    fi
}



function view_all {
	printf "\nAll students:\n"
	less students-list_1023.txt
}

option='7'
while true; do
    if [ $option == '1' ]; then
        register_student
    elif [ $option == '2' ]; then
        search_student
    elif [ $option == '3' ]; then
      	view_all
    elif [ $option == '4' ]; then
         update_student
    elif [ $option == '5' ]; then
       	deleteStudent
    elif [ $option == '6' ]; then
        clear
        print_menu
    elif [ $option == '7' ]; then
        print_menu
    elif [ $option == '8' ]; then
        printf "\nBye!\n"
        exit 0
    else
        printf "\nInvalid option!\n"
    fi
    read -r -p "Choose option: " option
done

