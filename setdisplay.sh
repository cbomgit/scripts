#!/bin/bash


if [ -z "$1" ]; then
    echo "Usage: setdisplay.sh [-dle] "
    echo "-d   : Set the screen to desktop mode. Requires second argument for external device name."
    echo "-l   : Set the screen to laptop mode"
    echo "-e   : Turn on both screens. Requires two more arguments for device names."
else
    if [ "$1" == "-d" ]; then
        xrandr --output $2 --auto --primary --output LVDS1 --off
    elif [ "$1" == "-l" ]; then
        xrandr --output LVDS1 --auto --primary --output VGA1 --off
    elif [ "$1" == "-e" ]; then
        xrandr --output $2 --auto --left-of $3 --primary --output $3 --auto
    fi
fi

setbg.sh

exit
