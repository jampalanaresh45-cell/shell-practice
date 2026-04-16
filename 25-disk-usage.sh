#!/bin/bash
DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=75 ## In project we keepp it as 75 ##
IPADDRESS=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
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