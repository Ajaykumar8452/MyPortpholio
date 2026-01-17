#!/usr/bin/bash

#How to store a key value pair in Array

declare -A arr
arr=([name]=Ajay [age]=28 [city]=mumbai)

echo "${arr[name]}"
