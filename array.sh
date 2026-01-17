#!/usr/bin/bash

#This is an Array
<<comment
myArray=( 1 2 33.5 Ajay Yadav Hi )
echo "Value on 2nd Index is ${myArray[2]}"
echo "Value on 2nd Index is ${myArray[*]}"

#How to get length of array

echo "Lenght of an Array is ${#myArray[*]}"
comment

number=(appale banana cherry dragon egg fish grapes)
echo "${number[*]}"
echo "${number[*]::3}"

num=(12 23 54 1 2 90 80)
echo "Prinitng 3 to 5 vlaues: ${num[*]:2:3}"

num+=(ajay yadav kumar)
echo "Now value of array is: ${num[*]}"

echo "Lenght of an Array is: ${#num[*]}"
