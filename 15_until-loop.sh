#!/usr/bin/bash
#
#Until Loop
#

count=10
until [ $count -le 5 ]
do
	echo "$count"
	let count--
done

