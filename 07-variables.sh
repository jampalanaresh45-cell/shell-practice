#! /bin/bash
#####Date Variables#####

START_TIME=$(date +%s) # Capture start time in seconds since

sleep 10& # Simulate a process with sleep

END_TIME=$(date +%s) # Capture end time in seconds since

TOTAL_TIME=$((END_TIME - START_TIME)) # Calculate total time taken

echo "Script execution time: $TOTAL_TIME seconds"