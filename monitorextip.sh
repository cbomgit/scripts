#!/bin/bash

EMAIL=christianbboman@gmail.com
if [ -f $HOME/.extip ]; then
   IP="$(cat ~/.config/monitorpi/extip)"
else
   IP=$(curl icanhazip.com)
fi

while true; do

   CURRENT_IP="$(curl -s icanhazip.com)"

   if [[ "$(iwgetid wlan0 -r)" == "stickykeys" ]] && [ $? -eq 0 ] && [ ! $(pgrep vpnc) ] && [[ "$IP" != "$CURRENT_IP" ]]; then
      IP=$CURRENT_IP
      echo "$IP" | mail -s "External IP Changed" $EMAIL
      echo "$IP" > ~/.config/moinitorpi/extip
   fi

   sleep 1h

done
