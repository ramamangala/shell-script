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
logs_folder="/var/log/13nov25shellscriptlogs"
log_file=$(echo $0 | cut -d "." -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S)
log_file_name="$logs_folder/$log_file-$time_stamp.log"

validate() {
	if [ $1 -ne 0 ]
	then
		echo -e "in validate(), $2 $R FAILED"
		exit 1
	else
		echo -e "in validate(), $2 $G SUCCESS"
	fi	
}

dnf list installed mysql &>> $log_file_name
if [ $? -ne 0 ]
then
	dnf install mysql -y &>> $log_file_name
	validate $? "MYSQL INSTALLATION"
else
	echo -e "MYSQL is already $Y installed"
fi
dnf list installed git &>> $log_file_name
if [ $? -ne 0 ]
then
	dnf install git -y &>> $log_file_name
	validate $? "GIT INSTALLATION"
else
	echo -e "GIT is already $Y installed"
fi
