#!/bin/bash

if [ -f $XDG_CONFIG_HOME/dmenurc ]; then
   . $XDG_CONFIG_HOME/dmenurc
fi

i3-msg "rename workspace to $(ws_num.py):$1"
