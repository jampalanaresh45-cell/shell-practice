#!/bin/bash
#####special variable script#####

echo "special variables: $@" ##To accept all
echo "special variables: $*"
echo "script variable $0" ##To accept script name
echo "special char variable for current Directory $PWD"
echo "special char variable for current user $USER"
echo "special char variable for current home directory $HOME"
echo "special PID exit status: $$"
sleep 10 &
echo "special char variable for last background process id $!"