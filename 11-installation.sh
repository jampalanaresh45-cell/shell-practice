#!/bin/bash
####Installation of packages in shell script####

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: User must have privilege accesss"
    fi
    dnf install mysql -y
    if [ $? -ne 0 ]; then
        echo "ERROR::MYSQL installation failed"
    else
        echo "MySQL installation succeeded"
    fi