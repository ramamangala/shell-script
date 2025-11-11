#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then 
	echo "ERROR: you must have sudo access to run this script"
	exit 1
fi
R="\e[31m"
G="\e[32m"
Y="\e[33m"
validate() {
	if [ $1 -ne 0 ]
	then
		echo -e "in validate(), $2 $R FAILED"
		exit 1
	else
		echo -e "in validate(), $2 $G SUCCESS"
	fi	
}

dnf list installed mysql
if [ $? -ne 0 ]
then
	dnf install mysql -y
	validate $? "MYSQL INSTALLATION"
else
	echo -e "MYSQL is already $Y installed"
fi
dnf list installed git
if [ $? -ne 0 ]
then
	dnf install git -y
	validate $? "GIT INSTALLATION"
else
	echo -e "GIT is already $Y installed"
fi
