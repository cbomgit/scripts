#!/bin/bash

if [ ! $1 ]; then

   echo "Hostname not given. Exiting."
   exit 1
fi
echo "christian ALL=(ALL) ALL" >> /etc/sudoers #add me to sudoers
passwd #set root passwd


#add me and smbguest
useradd -m -G wheel,power,storage,audio,network,mail -s /usr/bin/zsh christian

#set my password
passwd christian

###################create initramfs and enable services#######
mkinitcpio -p linux

exit 0
