#!/bin/bash

if [ -f $XDG_CONFIG_HOME/dmenurc ]; then
   . $XDG_CONFIG_HOME/dmenurc
   DMENU="$DMENU -p 'Rename Workspace' -noinput"
else
   DMENU="dmenu -i -p 'Rename Workspace' -noinput"
fi

NUM=$(ws_num.py)
NAME=$(eval $DMENU)

if [ $? -eq 0 ]; then
   i3-msg "rename workspace to $NUM:$NAME"
fi

#i3-input -F "rename workspace to $(ws_num.py):%s" -P "Rename workspace:"
