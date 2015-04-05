#!/bin/bash



if [ -d /etc/X11/xinit/xinitrc.d ]; then
     for f in /etc/X11/xinit/xinitrc.d/*; do
            [ -x "$f" ] && . "$f"
              done
                unset f
                fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xrandr --output HDMI1 --left-of HDMI2 

xrdb -merge .Xresources 

wallpaperd &

compton -o 0.4 -D 6 -f -e 0 -G -b -m 1 --backend=glx --paint-on-overlay --vsync=opengl-swc

xautolock -time 5 -locker "dm-tool lock"

seafile-applet &

conky &

thunderbird &

