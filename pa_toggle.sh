#!/bin/bash

for i in $(pactl list sinks | grep "Sink #" | cut -d'#' -f 2); do 
   pactl set-sink-mute $i toggle; 
done

