#!/usr/bin/bash

myvar="Hi Ajay Yadav"

echo "Length of variable: ${#myvar}"

echo "${myvar:3:4}"
echo "Upper case ---- ${myvar^^}"
echo "Lower case ----${myvar,,}"

echo "Slicing ---- ${myvar/Yadav/Kumar}"

