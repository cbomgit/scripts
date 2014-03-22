#!/bin/bash
eval $1

if [ $? -eq 0 ]; then

   export DISPLAY=:0
   export XAUTHORITY=/home/christian/.Xauthority
     
   CARD=/sys/class/drm/card0/card0-
   LAYOUT_DIR=$HOME/.config/.screen_layouts
   ID=""

   for i in $CARD*; do

      SCREEN_ID=$(cat $i/edid | parse-edid | grep "Identifier" | awk '{print $2}')

      if (( ${#SCREEN_ID} > 0 )); then

         SCREEN_ID=$(echo ${SCREEN_ID:1:$((${#SCREEN_ID} - 2))})
         ID="$ID$SCREEN_ID"
      fi
   done

   touch $LAYOUT_DIR/$ID && echo "$1" > $LAYOUT_DIR/$ID

fi
