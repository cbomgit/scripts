#!/bin/bash

if [[ "$1" == "n" ]]; then
   CMD='df -h / /home /mnt/data /mnt/raid'
else
   CMD='df -h / /home /mnt/data /mnt/raid /mnt/backup*'
fi

echo "Calculating space on the following folders..."
eval $CMD

echo "Total space is: $(eval $CMD | awk '{print $3}' | tail -n +2 | sed 's/\(G\|M\)//g' | awk '{s+=$1} END {print s}')"

