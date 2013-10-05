#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: setdisplay.sh [-dle] "
    echo "-d   : Set the screen to desktop mode"
    echo "-l   : Set the screen to laptop mode"
    echo "-e   : Turn on both screens"
else
    if [ "$1" == "-d" ]; then
        xrandr --output HDMI1 --auto --output LVDS1 --off
    elif [ "$1" == "-l" ]; then
        xrandr --output LVDS1 --auto --output HDMI1 --off
    elif [ "$1" == "-e" ]; then
        xrandr --output HDMI1 --auto --left-of LVDS1 --output LVDS1 --auto
    fi
fi

exit
