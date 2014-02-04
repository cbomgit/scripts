#!/bin/bash


export DISPLAY=:0
export XAUTHORITY=/home/christian/.Xauthority

#directory containg screens
CARD=/sys/devices/pci0000:00/0000:00:02.0/drm/card0

#director where all xrandr commands will be stored
LAYOUT_DIR=/home/christian/.screen_layouts


while inotifywait -re modify,create,delete,open,close,close_write,access $CARD; do

   sleep 2

   #Identifier that will be built for this screen configuration
   ID=""

   #loop through all the inputs and build unique identifier for each one based on their edid
   for i in $CARD/card0-*; do

      SCREEN_ID=$(cat $i/edid | parse-edid | grep "VendorName" | awk '{print $2}')

      #a disconnected input will have a blank edid
      if (( ${#SCREEN_ID} > 0 )); then

         #remove quotation marks from the identifier
         SCREEN_ID=$(echo ${SCREEN_ID:1:$((${#SCREEN_ID} - 2))})

         #append the SCREEN_ID to the master id
         ID="$ID$SCREEN_ID"
      fi

   done


   #check if an ID for this setup has been set before, otherwise let xrandr figure it out
   eval $(cat $LAYOUT_DIR/$ID) || xrandr --auto

   #restore the background image so it fits the screen
   eval $(cat /home/christian/.fehbg)

done

