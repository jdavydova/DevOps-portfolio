
# Linux Basics 

🔸 [EXERCISE 1: Linux Mint Virtual Machine]

Create a Linux Mint Virtual Machine on your computer. Check the distribution, which package manager it uses (yum, apt, apt-get). Which CLI editor is configured (Nano, Vi, Vim). What software center/software manager it uses. Which shell is configured for your user. 



🔸 [EXERCISE 2: Bash Script - Install Java](linux-basics/exercise-2-bash-script-install-java.sh)

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

🔸 [EXERCISE 3:Bash Script - User Processes](linux-basics/exercise-3-user-processes.sh)

Write a bash script using Vim editor that checks all the processes running for the current user (USER env var) and prints out the processes in console. Hint: use ps aux command and grep for the user.

🔸 [EXERCISE 4: Bash Script - User Processes Sorted](linux-basics/exercise-4-user-processes-sorted.sh)

Extend the previous script to ask for a user input for sorting the processes output either by memory or CPU consumption, and print the sorted list.

🔸 [EXERCISE 5: Bash Script - Number of User Processes Sorted](linux-basics/exercise-5-number-of-user-processes-sorted.sh)

Extend the previous script to ask additionally for user input about how many processes to print. Hint: use head program to limit the number of outputs. 

🔸 [EXERCISE 6: Bash Script - Start Node App](linux-basics/exercise-6-start-node-app.sh)

Write a bash script with following logic: 

Install NodeJS and NPM and print out which versions were installed
Download an artifact file from the URL: https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz. Hint: use curl or wget
Unzip the downloaded file
Set the following needed environment variables: APP_ENV=dev, DB_USER=myuser, DB_PWD=mysecret
Change into the unzipped package directory
Run the NodeJS application by executing the following commands:  npm install and node server.js
Notes:

Make sure to run the application in background so that it doesn't block the terminal session where you execute the shell script
If any of the variables is not set, the node app will print error message that env vars is not set and exit
It will give you a warning about LOG_DIR variable not set. You can ignore it for now.


🔸 [EXERCISE 7: Bash Script - Node App Check Status]

Extend the script to check after running the application that the application has successfully started and prints out the application's running process and the port where it's listening. 
