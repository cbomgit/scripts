#!/bin/bash

ping -c 1 -W 1 -q alarmpi > /dev/null

if [ $? -eq 0 ]; then
   export MPD_HOST=alarmpi
else
   ping -c 1 -W 1 -q 192.168.0.2 > /dev/null
   
   if [ $? -eq 0 ]; then
      export MPD_HOST=192.168.0.2
   else
      export MPD_HOST=localhost
   fi
fi
