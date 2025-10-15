#!/bin/bash

# =======================================
#
#  Exercise 3: Bash Script - User Processes

# ======================================

# This script lists all processes running for the current user
# using ps and grep commands.

# =====================================


echo "Checking process for user: $USER"

ps aux | grep 	"^$USER"

process_count=$(ps -u "$USER" | wc -l)
echo "Total processes for $USER: $process_count"
