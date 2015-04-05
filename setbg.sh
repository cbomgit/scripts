#!/bin/bash


if [ -z "$1" ]; then
    find /mnt/raid/Wallpapers/dual_walls -type f \( -name '*.jpg' -o -name '*.png' \) -print0 | shuf -n1 -z | xargs -0 feh --bg-tile
else
    sh ~/.fehbg
fi

