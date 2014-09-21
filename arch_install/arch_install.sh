#!/bin/bash

if [ ! $1 ]; then

   echo "Hostname not given. Exiting."
   exit 1
fi
echo "christian ALL=(ALL) ALL" >> /etc/sudoers #add me to sudoers
passwd #set root passwd

groupadd sambashare  #great sambshare group

#add me and smbguest
useradd -m -G wheel,power,storage,audio,network,mail -s /usr/bin/zsh christian
useradd -c "Samba Guest" -d /dev/null -s /bin/false smbguest

#set my password
passwd christian

#add me and smbguest to the sambashare group
usermod -a -G sambashare smbguest
usermod -a -G sambashare christian

#set the samba passwords
smbpasswd -a -n smbguest
smbpasswd -a christian

###################copy over config files#####################

cp -rv boot home etc /

###################set up the samba mount#####################
mkdir /mnt/samba

###################create initramfs and enable services#######
mkinitcpio -p linux
systemctl enable gdm sshd transmission smbd nmbd

exit 0
