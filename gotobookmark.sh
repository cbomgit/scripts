#!/bin/bash

if [ -f $HOME/.config/dmenurc ]; then
   source $HOME/.config/dmenurc
else
   DMENU="dmenu -i"
fi

DMENU="$DMENU -p 'Quickmarks:' -w 1366 -l 100 -fn 'Liberation Mono-10:normal'"
BOOKMARKS=/home/christian/.config/chromium/Default/Bookmarks

GOTO=$(gotobookmark.py | eval $DMENU)

if [ $? -eq 0 ]; then
   exec $BROWSER $(echo "$GOTO" | awk '{print $2}')
fi
