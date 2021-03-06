#!/usr/bin/zsh

#backup the contets of / to external source

USER=root
DEST=192.168.0.14
MODULE=backup

if [[ $EUID != 0 ]]; then
   echo "Backup must be run as root"
   exit 1
fi

rsync -aAXv /* --exclude={/dev/,/proc,/sys,/tmp,/run,/mnt,/media,/lost+found,/home/christian/.cache,/home/christian/Virtualbox\ VMs,/home/christian/.thumbnails,/home/christian/Music,/home/christian/Network,/home/christian/Dropbox,/home/christian/.dropbox,/home/christian/.dropbox-dist,/var/lib/pacman/sync,/var/log/journal} $USER@$DEST::$MODULE
