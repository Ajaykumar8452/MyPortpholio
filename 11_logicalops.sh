#!/usr/bin/bash

#Logical Operators:


read -p "Enter your age:" age
read -p "Where are you from?" desh
if [[ $age -ge 18 ]] && [[ $desh == "India" ]]
then 
	echo "You are eligible for vote"
else
	echo "Sorry! You are not!"
fi

[ $age -ge 18 ] && echo "Adult" || echo "Minor"

