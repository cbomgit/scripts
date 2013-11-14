#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
   source $HOME/.dmenurc
else
   DMENU="dmenu -i"
fi

input="$( xsel -o | eval $DMENU )"

if [ "$input" != '' ]; then
   result="$( echo "$input" | locate -e -r "$input" | eval $DMENU )"
   xdg-open "$result"
fi
   
