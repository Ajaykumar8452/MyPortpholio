#/usr/bin/bash
#
#For Loop

echo "Number is:"
for i in {1..20}
do
	if [ $i % 2 -eq 0 ]
	then
		echo "$i"
	else
		echo "No"
	fi

done

