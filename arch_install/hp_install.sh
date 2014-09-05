#!/bin/bash

if [ ! $1 ]; then

   echo "Hostname not given. Exiting."
   exit 1
fi

if [ ! $2 ]; then
   echo "No Destination device given. Exiting."
   exit 1
fi

pacman -Syy
pacman -S --noconfirm zsh vim

setfont Lat2-Terminus16

#generate the locale
sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen
locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

#set the console font
echo FONT=Lat2-Terminus16 > /etc/vconsole.conf

#set the time zone
ln -s /usr/share/zoneinfo/America/Denver /etc/localtime

#set system clock
hwclock --systohc --utc

#set the hostnames
echo $1 > /etc/hostname
vim /etc/hosts

#install and set bootloader
pacman -S --noconfirm grub os-prober
os-prober
grub-install --target=i386-pc --recheck $2

#configure the repos
cp etc/pacman.conf /etc/pacman.conf
pacman-key -r 962dde58
pacman-key --lsign-key 962dde58

pacman -Syy

#install the rest of the system
pacman -S --needed --noconfirm $(cat hp_native_packages.txt)
pacman -S --noconfirm infinality-bundle ibfonts-meta-base infinality-bundle-multilib 

################do user stuff#############################

visudo #add me to sudoers
passwd #set root passwd


#add me and smbguest
useradd -m -G wheel,power,storage,audio,network,mail -s /usr/bin/zsh christian

#set my password
passwd christian

###################copy over config files#####################

cp -rv hp/home hp/etc /

###################create initramfs and enable services#######
mkinitcpio -p linux
systemctl enable lightdm NetworkManager

##################install AUR packages ######################

su -c "/scripts/arch_install/hp_aur_install.sh" - christian
exit 0
