#!/usr/bin/zsh


DETECT=$(xrandr -q | grep "HDMI1 connected")

if [ $DETECT ]; then
    setdisplay.sh -d
    echo "Setting HDMI1 as primary display"
else
    setdisplay.sh -l
    echo "Setting laptop as primary display"
fi



