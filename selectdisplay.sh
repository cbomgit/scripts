#!/usr/bin/zsh

if [ -f $HOME/.dmenurc ]; then
   source $HOME/.dmenurc
else
   DMENU="dmenu -i"
fi

HDMI=$(xrandr -q | grep "HDMI connected")
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
      xrandr --output LVDS1 --auto --output HDMI1 --off --output VGA1 --off
   ;;
   "Extend to HDMI")
      xrandr --output HDMI1 --auto --output LVDS1 --auto --right-of HDMI1
   ;;
   "HDMI1")
      xrandr --output HDMI1 --auto --output LVDS1 --off --output VGA1 --off
   ;;
   "HDMI,VGA, No Laptop")
      xrandr --output HDMI1 --auto --output VGA1 --auto --right-of HDMI1 --output LVDS1 --off
   ;;
   "Extend to VGA")
      xrandr --output VGA1 --auto --left-of LVDS1 --output LVDS1 --auto 
   ;;
   "VGA")
      xrandr --output VGA1 --auto --output LVDS1 --off --output HDMI --off 
   ;;
esac
