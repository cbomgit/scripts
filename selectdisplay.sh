#!/usr/bin/zsh

if [ -f $HOME/.dmenurc ]; then
   source $HOME/.dmenurc
else
   DMENU="dmenu -i"
fi

HDMI=$(xrandr -q | grep "HDMI1 connected")
VGA=$(xrandr -q | grep "VGA1 connected")


DISPLAYS="Displays: [ LVDS1 ]"
DMENU_OPTIONS="Laptop"

if [ $HDMI ]; then
   DISPLAYS="$DISPLAYS [ HDMI ]"
   DMENU_OPTIONS="$DMENU_OPTIONS\nExtend to HDMI\nHDMI"

   if [ $VGA ]; then
      DMENU_OPTIONS="$DMENU_OPTIONS\nHDMI,VGA, No Laptop"
   fi
fi

if [ $VGA ]; then
   DISPLAYS="$DISPLAYS [ VGA ]"
   DMENU_OPTIONS="$DMENU_OPTIONS\nExtend to VGA\nVGA"
fi

CMD=$(printf "$DMENU_OPTIONS" | eval "$DMENU -p '$DISPLAYS'")

case "$CMD" in

   "Laptop")
      XCMD="xrandr --output LVDS1 --auto --output HDMI1 --off --output VGA1 --off"
   ;;
   "Extend to HDMI")
      XCMD="xrandr --output HDMI1 --mode 1920x1080i --output LVDS1 --auto --right-of HDMI1"
   ;;
   "HDMI")
      XCMD="xrandr --output HDMI1 --mode 1920x1080i --output LVDS1 --off --output VGA1 --off"
   ;;
   "HDMI,VGA, No Laptop")
      XCMD="xrandr --output HDMI1 --output 1920x1080i --output VGA1 --auto --right-of HDMI1 --output LVDS1 --off"
   ;;
   "Extend to VGA")
      XCMD="xrandr --output VGA1 --auto --left-of LVDS1 --output LVDS1 --auto" 
   ;;
   "VGA")
      XCMD="xrandr --output VGA1 --auto --output LVDS1 --off --output HDMI --off"
   ;;
esac

#save the command to a file to be executed on next restart
echo "$XCMD" > ~/.config/display_state

eval $XCMD

setbg.sh
