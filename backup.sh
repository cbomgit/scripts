#!/bin/bash

BACKUP_DIR="/mnt/backup"
RSYNC_CMD="rsync -aAXv --delete"

#do a package cache cleanup
pacman -Scc --noconfirm

#make a list of packages installed by pacman -S
pacman -Qemq > $BACKUP_DIR/pacakes.txt

#make a list of installed aur packages and copy over the aur directory 
#for good measure
pacman -Qemq > $BAKCUP_DIR/aur_pkgs.txt
eval $RSYNC_CMD /home/christian/.aur/* $BACKUP_DIR/home/christian/.aur

#backup config directories and files
eval $RSYNC_CMD /etc/* $BACKUP_DIR/etc
eval $RSYNC_CMD /home/christian/.config/* $BAKCUP_DIR/home/christian/.config
cp -ar /home/christian/.zshrc /home/christian/.vimrc /home/christian/.i3* /home/christian/.Xresources /home/christian/.local/share/applications/ /home/christian/Documents /home/christian/.mpd $BACKUP_DIR/home/christian/

#do a mysql dump
mysqldump --defaults-file=/root/.my.cnf --all-databases > $BACKUP_DIR/dump.sql

#backup pictures
eval $RSYNC_CMD /mnt/raid/Pictures/* $BACKUP_DIR/Pictures

#backup music
eval $RSYNC_CMD /mnt/raid/Music/* $BACKUP_DIR/Music
