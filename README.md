
# Linux Basics 

🔸 [EXERCISE 1: Linux Mint Virtual Machine](linux-basics/exercise-2-bash-script-install-java.sh)

Create a Linux Mint Virtual Machine on your computer. Check the distribution, which package manager it uses (yum, apt, apt-get). Which CLI editor is configured (Nano, Vi, Vim). What software center/software manager it uses. Which shell is configured for your user. 



🔸 [EXERCISE 2: Bash Script - Install Java]

Write a bash script using Vim editor that installs the latest java version and checks whether java was installed successfully by executing a java -version command.

After installation command, it checks 3 conditions:

1. whether java is installed at all
2. whether an older Java version is installed (java version lower than 11)
3. whether a java version of 11 or higher was installed
It prints relevant informative messages for all 3 conditions. Installation was successful if the 3rd condition is met and you have Java version 11 or higher available.

Hint: The awk command helps process text by letting you extract specific parts of each line, using spaces or other characters as dividers between those parts.

As an example: echo "apple banana cherry" | awk '{print $2}'

Would output: banana

You can see more examples here: https://www.tutorialspoint.com/awk/awk_basic_examples


linux-basics/exercise-2-bash-script-install-java.sh
🔸 Шпаргалка:
- [Linux Command Cheat Sheet (PDF)](https://files.fosswire.com/2007/08/fwunixref.pdf)
