#!/usr/bin/bash

#If-else condition

read -p "Enter 1st Number:" num1
read -p "Enter 2nd Number:" num2

if [ $num1 -gt $num2 ]
then
	echo "$num1 is Greater than $num2"
else
	echo "$num2 is greater than $num1"
fi


