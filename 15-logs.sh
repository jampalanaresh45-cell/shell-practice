#! /bin/bash
####Logging in shell script####

R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
N="\e[0m"  #No Color

LOG_FOLDER="/var/log/shellscript"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo "script started at $(date)"

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
    dnf list installed mysql &>>LOG_FILE
    if [ $? -ne 0 ]; then    
    dnf install mysql -y &>>LOG_FILE
    VALIDATE $? "mysql"
    else
        echo -e "MySQL is already installed $Y...SKIPPING $N"
    fi

    dnf list installed nginx &>>LOG_FILE
        if [ $? -ne 0 ]; then
    dnf install nginx -y &>>LOG_FILE
        VALIDATE $? "nginx"
    else
        echo -e "Nginx is already installed $Y...SKIPPING $N"
    fi

    dnf list installed python3 &>>LOG_FILE
        if [ $? -ne 0 ]; then
    dnf install python3 -y &>>LOG_FILE
        VALIDATE $? "python3"
    else
        echo -e "Python3 is already installed $Y...SKIPPING $N"
    fi

