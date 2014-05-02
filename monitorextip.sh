#!/bin/bash

EMAIL=christianbboman@gmail.com
IP_PATH=/home/christian/.config/monitorextip/ip
IFACE="wlp1s0"
AP="stickykeys"

if [ -f $IP_PATH ]; then
   IP="$(cat $IP_PATH)"
else
   touch $IP_PATH
   IP=$(curl icanhazip.com)
   echo "$IP" | mail -s "External IP Changed" $EMAIL
   echo "$IP" > $IP_PATH
fi

while true; do

   CURRENT_IP="$(curl -s icanhazip.com)"

   if [[ "$(iwgetid $IFACE -r)" == "$AP" ]] && [ $? -eq 0 ] && [ ! $(pgrep vpnc) ] && [[ "$IP" != "$CURRENT_IP" ]]; then
      IP=$CURRENT_IP
      echo "$IP" | mail -s "External IP Changed" $EMAIL
      echo "$IP" > $IP_PATH
   fi

   sleep 1h

done
