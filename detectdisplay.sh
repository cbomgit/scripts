#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/christian/.Xauthority

if [[ $(xrandr | grep "VGA1 connected") ]]; then
   xrandr --output VGA1 --auto --left-of LVDS1 --primary --output LVDS1 --auto
elif [[ $(xrandr | grep "HDMI1 connected") ]]; then
   xrandr --output HDMI1 --auto --primary --output LVDS1 --right-of HDMI1
else
   xrandr --output LVDS1 --auto --primary --output HDMI1 --off --output VGA1 --off
fi

