#!/bin/bash

# Author: cm3z4 ----------------------------------------------------------
# Contributor: cosasdepuma -----------------------------------------------
#
#      ██╗ ██████╗ ██╗  ██╗███████╗    ██████╗  ██████╗ ████████╗
#      ██║██╔═══██╗██║ ██╔╝██╔════╝    ██╔══██╗██╔═══██╗╚══██╔══╝
#      ██║██║   ██║█████╔╝ █████╗      ██████╔╝██║   ██║   ██║
# ██   ██║██║   ██║██╔═██╗ ██╔══╝      ██╔══██╗██║   ██║   ██║
# ╚█████╔╝╚██████╔╝██║  ██╗███████╗    ██████╔╝╚██████╔╝   ██║
#  ╚════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝    ╚═════╝  ╚═════╝    ╚═╝

# A bot/script that commits a joke from icanhazdadjoke.com as needed.

# INSTRUCTIONS:

# This script requires the below dependencies to run:

#   1. curl
#   2. git

# The following commands will install the dependencies on Debian/Arch based systems.

#   1. sudo apt install curl git
#   2. sudo pacman -S curl git

# You will need to configure git to commit with saved credentials.

# You will need to use cron to automate this script on a Linux system.
# Use the link below to get started with editing a crontab.
# https://www.ostechnix.com/a-beginners-guide-to-cron-jobs/

# ------------------------------------------------------------------------
# ------------------------------------------------------------------------

# Creates the service variable
service="https://icanhazdadjoke.com/"

# Creates the date variable.

commitDate="Commit: $(date)"

# Creates the output file variable. You can rename the "jokes.txt" as needed.

output_file="jokes.txt"

# YOU WILL NEED TO CHANGE THE BELOW PATH TO THE DIRECTORY WHERE YOU PLACED THIS SCRIPT!!!
# Example: ~/Downloads/Joke_Bot/

directory="~/Drive/Projects/Scripts/Joke_Bot/"

# Changes the directory to where the log will be created.
test -d $directory && cd $directory || exit 1

# Logs the date variable to the given text file below.
echo "$commitDate" >> $output_file

# Check if the service is available
curl -sfo /dev/null $service || exit 1

# Grabs a single joke from icanhazdadjoke.com and logs it to the given text file.
curl -sH "Accept: text/plain" $service >> $output_file

# Adds some spacing between jokes.
printf "\n\n" >> $output_file

# Commit after the joke has been received and added to the output file.
git add $output_file
git commit -m "$commitDate"
git push origin master

# THE END