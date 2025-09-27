#!/bin/bash
####Installation of packages in shell script####

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: User must have privilege accesss"
    exit 1
    fi
    VALIDATE(){
        if [ $1 -ne 0 ]; then
        echo "ERROR::Installation of $2 failed"
        exit 1
    else
        echo "Installation of $2 succeeded"
    fi
    }
    dnf install mysql -y
    VALIDATE $? "mysql"

    dnf install nginx -y
    VALIDATE $? "nginx"

    dnf install mongodb-mongosh -y
    VALIDATE $? "mongodb-mongosh"
    