#!/bin/bash

EMAIL=christianbboman@gmail.com
IP="$(curl -s icanhazip.com)"

while true; do

   TEMP_IP="$(curl -s icanhazip.com)"

   if [[ "$IP" != "$TEMP_IP" ]]; then
      IP=$TEMP_IP
      echo "$IP" | mail -s "External IP Changed" $EMAIL
   fi

   sleep 1h

done
