#!/bin/bash
####Installation of packages in shell script####

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: User must have privilege accesss"
    exit 1
    fi
    dnf install mysql -y
    if [ $? -ne 0 ]; then
        echo "ERROR::MYSQL installation failed"
        exit 1
    else
        echo "MySQL installation succeeded"
    fi