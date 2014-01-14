#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
   source $HOME/.dmenurc
else
   DMENU="dmenu -i"
fi

BOOKMARK=$(dumpbookmarks.py | eval $DMENU)

if [ $? -eq 0 ]; then
   exec dwb $BOOKMARK
fi
