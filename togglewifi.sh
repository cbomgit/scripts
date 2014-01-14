#!/bin/zsh

if [[ "$(iw dev wlan0 link)" == "Not connected." ]]; then
   sudo systemctl start netctl-auto@wlan0.service
else
   sudo systemctl stop netctl-auto@wlan0.service
fi


