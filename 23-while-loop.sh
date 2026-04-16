#!/bin/bash
# count=5

# echo "staring countdown ..."
# while [ $count -gt 0 ]
#  do
#     echo "Time left: $count"
#     sleep 1
#     count=$((count-1))
# done

# echo "Time's up!"

#!/bin/bash
file="20-script.sh"

while IFS= read -r line; do
    echo "Processing: $line"
done < "$file"