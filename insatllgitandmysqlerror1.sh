#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then 
	echo "ERROR: you must have sudo access to run this script"
	exit 1
fi
dnf install mysql -y
if [ $? -ne 0 ]
then
	echo "MYSQL installation FAILED.."
	exit 1
else
	echo "MYSQL installation SUCCESS.."
fi

dnf install git -y
if [ $? -ne 0 ]
then
        echo "GIT installation FAILED.."
        exit 1
else
        echo "GIT installation SUCCESS.."
fi

