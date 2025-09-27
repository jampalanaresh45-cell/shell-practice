#!/bin/bash
###Conditional statements in shell script###
NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "The number is less than 10"
else
    echo "The number is greater than or equal to 10"
fi