#!/bin/bash


if [[ $(ip addr | grep wlan0 | grep inet | awk {'print $2'}) ]]; then
   sudo -A systemctl stop netctl-auto@wlan0.service
else
   sudo -A systemctl start netctl-auto@wlan0.service
fi


