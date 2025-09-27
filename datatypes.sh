#!/bin/bash

###Datatypes in shell script###

NUMBER1=200
NUMBER2=300
SUM=$((NUMBER1 + NUMBER2))
echo "SUM is ${SUM}"

Contents=("AWS" "Linux" "Shell")
echo "the present contents of the Devsecops course are: ${Contents[@]}"
echo "the number of contents in the Devsecops course are: ${Contents[0]}" 
echo "the number of contents in the Devsecops course are: ${Contents[1]}"