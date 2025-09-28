#!/bin/bash
####Installation of packages in shell script####
R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
N="\e[0m"  #No Color

LOG_FOLDER="/var/log/shellscript"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo "script started at $(date)" | tee -a $LOG_FILE

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: User must have privilege access"
    exit 1
    fi
    VALIDATE(){
        if [ $1 -ne 0 ]; then
        echo -e "ERROR ::Installation of $R...$2 is failed $N"
        exit 1
    else
        echo -e "Installation of $G...$2 succeeded $N"
    fi
    }
    ### to loop all packages using @
    for package in $@
    do
    dnf list installed $package &>>LOG_FILE
    if [ $? -ne 0 ]; then    
    dnf install $package -y &>>LOG_FILE
    VALIDATE $? "$package"
    else
        echo -e "$package is already installed $Y...SKIPPING $N"
    fi  
    done