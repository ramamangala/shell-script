#!/bin/bash
num=$1
if [ $num -gt 100 ]
then
	echo "$num is greater than 100"
else
	echo "$num is less than or equals to 100"
fi
