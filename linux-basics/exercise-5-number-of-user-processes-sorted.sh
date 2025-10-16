#!/bin/bash

# ==========================================

# Exercise 5: Bash Script -  Number of User Processes Sorted

# ==========================================
# This script lists all processes for the current user ($USER)
# and allows sorting them by memory or CPU usage,
# as well as specifying how many results to display.
# ==========================================

echo " Checking processes for user: $USER"
echo "=========================================="
echo

echo "How would you like to sort your processes?"
echo "1) By Memory usage (type: mem)"
echo "2) By CPU usage (type: cpu)"

read -p "Enter your choice: " sort_choice
read -p "Please enter how many processes to print?" lines
echo

if [ "$sort_choice" = "mem" ]
then
    echo "Sorting process by Memory usage:"
    ps -u "$USER" --sort=-%mem | head -$lines
elif [ "$sort_choice" = "cpu" ]
then
    echo "Sorting process by CPU usage: "
    ps -u "$USER" --sort=-%cpu | head -$lines
else
    echo "Invalid input"
    exit 1
fi

