#!/bin/bash

#takes an argument, up or down

if [[ "$1" == "up" ]]; then
   for i in $(pactl list sinks | grep "Sink #" | cut -d'#' -f 2); do 
      pactl set-sink-volume $i +5%; 
   done
elif [[ "$1" == "down" ]]; then
   for i in $(pactl list sinks | grep "Sink #" | cut -d'#' -f 2); do 
      pactl set-sink-volume $i -5%; 
   done
fi


