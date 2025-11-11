#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then 
	echo "ERROR: you must have sudo access to run this script"
	exit 1
fi

validate() {
	if [ $1 -ne 0 ]
	then
		echo "in validate(), $2 FAILED"
		exit 1
	else
		echo "in validate(), $2 SUCCESS"
	fi	
}

dnf list installed mysql
if [ $? -ne 0 ]
then
	dnf install mysql -y
	validate $? "MYSQL INSTALLATION"
else
	echo "MYSQL is already installed"
fi
dnf list installed git
if [ $? -ne 0 ]
then
	dnf install git -y
	validate $? "GIT INSTALLATION"
else
	echo "GIT is already installed"
fi
