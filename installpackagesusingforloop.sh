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
N="\e[0m"
logs_folder="/var/log/15nov25shellscriptlogs"
log_file=$(echo $0 | cut -d "." -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S)
log_file_name="$logs_folder/$log_file-$time_stamp.log"

validate() {
	if [ $1 -ne 0 ]
	then
		echo -e "in validate(), $2 $R FAILED $N"
		exit 1
	else
		echo -e "in validate(), $2 $G SUCCESS $N"
	fi	
}

for package in $@
do
	dnf list installed $package &>> $log_file_name
	if [ $? -ne 0 ]
      	then
        	dnf install $package -y &>> $log_file_name
        	validate $? "$package INSTALLATION"
	else
        	echo -e "$package is already $Y installed $N"
	fi
done
