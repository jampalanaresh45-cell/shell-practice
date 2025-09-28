#!/bin/bash
####Installation of packages in shell script####
R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
N="\e[0m"  #No Color

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
    echo "Installing package is :$package"
    done