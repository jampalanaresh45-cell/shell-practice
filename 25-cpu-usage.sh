#!/bin/bash
DISK_USAGE=$(df -hT | grep Filesystem)

while IFS= read -r line; do
    echo "Processing: $line"
done <<< "$DISK_USAGE"