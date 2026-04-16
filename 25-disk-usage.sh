#!/bin/bash
DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=10 ## In project we keepp it as 75 ##
IPADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
MESSAGE=""

while IFS= read -r line; 
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ $USAGE -gt $DISK_THRESHOLD ]; then
        MESSAGE+="Disk usage on partition $PARTITION is above threshold: $USAGE% \n" ## Escaping new line character in message body ##
    fi
done <<< "$DISK_USAGE"

echo -e "Message Body :$MESSAGE"

sh 26-mail.sh "jampalanaresh45@gmail.com" "Disk Usage Alert" "High Disk Usage" "$MESSAGE" "$IPADDRESS" "DevOps Team"

# TO_ADDRESS="$1"
# SUBJECT="$2"
# ALERT_TYPE="$3"
# MESSAGE_BODY="$4"