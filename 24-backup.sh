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
    echo -e "$R USAGE:: $0 sudo sh 24-backup.sh <SOURCE_DIR> <DESTINATION_DIR> <Days>[Optional, default 14 days] $N" | tee -a $LOG_FILE
}

## Check if the required number of arguments is provided ###
if [ $# -lt 2 ]; then
    USAGE 
    exit 1
fi

### check if the source and destination directories are existed or not ###

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R ERROR: $SOURCE_DIR directory does not exist $N" | tee -a $LOG_FILE
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]; then
    echo -e "$R ERROR: $DESTINATION_DIR directory does not exist $N" | tee -a $LOG_FILE
    exit 1
fi

### Find the files that are older than the specified number of days and store them in a variable ###
FILES=$(find $SOURCE_DIR -type f -mtime +"$DAYS")

if [ ! -z "${FILES}" ]; then
  ### start the archiving process ###
    echo -e "file found $FILES" 
    TIMESTAMP=$(date +"%F-%H-%M")
    ZIP_FILE="$DESTINATION_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE" 
    find $SOURCE_DIR -type f -mtime +"$DAYS" | zip -@ -j "$ZIP_FILE"

### Check archive file is created successfully or not ###
    if [ -f $ZIP_FILE ]
    then
        echo -e "Archive file successful: $ZIP_FILE $G[Success]$N" | tee -a $LOG_FILE

        ### Delete the original files after successful archiving ###
        while IFS= read -r filepath; 
        do
            echo -e "Deleting the file: $filepath $G[Success]$N" | tee -a $LOG_FILE
            rm -rf $filepath
            echo -e "Deleted the file: $filepath $G[Success]$N" | tee -a $LOG_FILE
        done <<< "$FILES_TO_DELETE"
    else
        echo -e "Archive failed $R[Error]$N" | tee -a $LOG_FILE
        exit 1
    fi

else
    echo -e "No files found to archive ...$Y....Exiting the script $N"
fi 