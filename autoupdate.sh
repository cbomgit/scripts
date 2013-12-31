#!/bin/bash

#append last update log to master log file
cat /etc/pacman.d/update.log >> /var/log/pacman.log

#clear auto update log file
echo > /etc/pacman.d/update.log

#run an update storing contents to the log file
pacman -Syu --noconfirm --logfile /etc/pacman.d/update.log > /dev/null

#send the log file as a email
su -c sendupdatelog.sh - christian
