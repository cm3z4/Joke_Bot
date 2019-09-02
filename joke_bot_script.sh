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

# Create the service variable.
service="https://icanhazdadjoke.com/"

# Create the date variable.
commitDate="Commit: $(date)"

# Create the output file variable. You can rename the "jokes.txt" as needed.
outputFile="jokes.txt"

# YOU WILL NEED TO CHANGE THE BELOW PATH TO THE DIRECTORY WHERE YOU PLACED THIS SCRIPT!!!
# Example: ~/Downloads/Joke_Bot/

directory="~/Drive/Projects/Scripts/Joke_Bot/"

# Change the directory to the script's location.
if test -d $directory; then cd $directory; fi

# Print the date to the output file.
echo "$commitDate" >> $outputFile

# Check if the service is available.
curl -sfo /dev/null $service || exit 1

# Grab a single joke from icanhazdadjoke.com and print it to the output file.
curl -sH "Accept: text/plain" $service >> $outputFile

# Add some spacing between jokes.
printf "\n\n" >> $outputFile

# Commit after the joke has been received and printed to the output file.
git add $outputFile
git commit -m "$commitDate"
git push origin master

# THE END