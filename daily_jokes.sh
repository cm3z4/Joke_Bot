#!/bin/bash
#
# I bot that commits a joke daily by cm3z4.
#
commitDate="Commit: $(date)"
cd ~/Drive/Projects/Scripts/Joke_Bot/
echo "$commitDate" >> jokes.txt
curl -H "Accept: text/plain" https://icanhazdadjoke.com/ >> jokes.txt
printf "\n\n" >> jokes.txt
git add jokes.txt
git commit -m "$commitDate"
git push origin master

