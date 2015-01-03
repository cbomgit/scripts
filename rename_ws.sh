#!/bin/bash

if [ -f ~/.config/dmenurc ]; then
   . ~/.config/dmenurc
   DMENU="$DMENU -p 'Rename Workspace' -noinput"
else
   DMENU="dmenu -i -p 'Rename Workspace' -noinput"
fi

DMENU="$DMENU -l 1 -x 0 -y 0" 
NUM=$(ws_num.py)

if [ $# -eq 1 ]; then
   i3-msg "rename workspace to $NUM:$1"
else
   NAME=$(eval $DMENU)
   i3-msg "rename workspace to $NUM:$NAME"
fi

