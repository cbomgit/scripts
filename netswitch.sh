#!/bin/zsh

if [ -f $HOME/.dmenurc ]; then
   source $HOME/.dmenurc
   DMENU="$DMENU -p 'Netctl Switcher'"
else
   DMENU="dmenu -i"
fi

PROFILES="$(ls /etc/netctl | grep "eth0\|wlan0")\nNone"

PROFILE=$(echo "$PROFILES" | eval $DMENU)

if [ $? -eq 0 ]; then
   sudo netctl stop-all


   if [[ "$PROFILE" != "None" ]]; then
      sudo netctl start $PROFILE
   fi
fi


