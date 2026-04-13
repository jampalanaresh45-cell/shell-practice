#!/bin/bash

set -e 

error() {
    echo "There is an Error in $LINENO, Command is: $BASH_COMMAND"
}
trap error ERR
echo "Hello.."
echo "Before error"
ccafj1;dnf
echo "After error"

