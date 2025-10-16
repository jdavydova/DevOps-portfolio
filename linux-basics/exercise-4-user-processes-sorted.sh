#!/bin/bash

# ==========================================

# Exercise 4: Bash Script - User Processes Sorted

# ==========================================
# This script lists all processes for the current user ($USER)
# and allows sorting them by memory or CPU usage based on user input.
# ==========================================

echo " Checking processes for user: $USER"
echo "=========================================="
echo

echo "How would you like to sort your processes?"
echo "1) By Memory usage (type: mem)"
echo "2) By CPU usage (type: cpu)"

read -p "Enter your choice: " sort_choice
echo

if [ "$sort_choice" == "mem" ]
then
    echo "Sorting process by Memory usage:"
    ps -u "$USER" --sort=-%mem
elif [ "$sort_choice" == "cpu" ]
then
    echo "Sorting process by CPU usage: "
    ps -u "$USER" --sort=-%cpu
else
    echo "Invalid input"
    exit 1
fi


