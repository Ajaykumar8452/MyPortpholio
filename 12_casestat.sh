#!/usr/bin/bash
#
#Case Statement


echo "1. Date"
echo "2. Wnat to know your currnet working directory"
echo "3. List the files"
read -p "Please Choose your Option:" opt

case $opt in 
	1)
		echo "The date is......"
		date
		;;

	2)
		echo "Your current working directory is..."
		pwd
		;;
	3)
		echo "List of Files are.."
		ls -ltr
		;;
	*)
		echo "Invalid Input..."
		echo "Please type correct option :)"
esac



