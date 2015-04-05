#!/bin/bash

ping -q -c 1 -W 10 hal.cbom.me > /dev/null

if [[ "$?" == "0" ]]; then
   echo "Hal is Ok!"
elif [[ "$?" == "1" ]]; then
   echo "No response from Ha!"
else
   echo "Unkown error"
fi
