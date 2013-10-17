#!/bin/bash

ping -c 1 -W 1 rpi > /dev/null && mpc -h rpi

if [ $? -eq 0 ]; then 
   MPD_HOST=rpi
else
   MPD_HOST=localhost
fi

export MPD_HOST
