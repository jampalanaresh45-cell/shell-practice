#!/bin/bash
###Even number check in shell script###
read NUMBER
if [ (($NUMBER % 2)) -eq 0 ]; then
    echo "The given $NUMBER is even"
else
    echo "The given $NUMBER is odd"
fi