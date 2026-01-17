#!/usr/bin/bash

#If-elif-elese condition


read -p "Could you enter your percentage?" per

if [ $per -ge 80 ]
then
	echo "You are passed with I division"
elif [ $per -ge 60 ]
then
	echo "You are passed with II division"
elif [ $per -ge 40 ]
then
	echo "You are passed with III division"
else
	echo "Oh Sorry!! You are failed"
fi

