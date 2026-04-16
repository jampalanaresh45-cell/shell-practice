#!/bin/bash
####Installation of packages in shell script####
USERID=$(id -u)
R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
N="\e[0m"  #No Color
SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

LOG_FOLDER="/var/log/shellscript"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"


mkdir -p $LOG_FOLDER
echo "script started at $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo -e "ERROR: This script must be run as root $N" | tee -a $LOG_FILE
    exit 1
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DESTINATION_DIR> <Days>[Optional, default 14 days] $N" | tee -a $LOG_FILE
}
if [ $# -le 2 ]; then
    USAGE 
fi

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R ERROR: $SOURCE_DIR directory does not exist $N" | tee -a $LOG_FILE
    exit 1
fi

if [ ! -d DESTINATION_DIR ]; then
    echo -e "$R ERROR: $DESTINATION_DIR directory does not exist $N" | tee -a $LOG_FILE
    exit 1
fi

FILES=$(find $SOURCE_DIR -type f -mtime +14)

if [ ! -z "${FILES}" ]; then
    echo -e "file found" 
else
    echo -e "No files found to archive ...$Y....Exiting the script $N" | tee -a $LOG_FILE
fi