#!/usr/bin/bash

name=Ajay
age=27
loc=Mumbai
echo "$name and his age is $age. He lives in $loc"

# How to run command in script
# Let take I want to check my machine hostname.

HOSTNAME=$(hostname)
echo "My Machine hostname is $HOSTNAME"

CWD=$(pwd) #CWD- Current working dirrectory
echo $CWD
echo $(pwd)

