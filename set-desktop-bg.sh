#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=~/.Xauthority

    IMAGE=$(find /mnt/raid/Wallpapers/dual_walls -type f \( -name '*.jpg' -o -name '*.png' \) -print0 | shuf -n1 -z)

    gsettings set org.gnome.desktop.background picture-uri "file://$IMAGE"
    gsettings set org.gnome.desktop.screensaver picture-uri "file://$IMAGE"

   
