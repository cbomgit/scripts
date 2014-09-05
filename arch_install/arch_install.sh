#!/bin/bash

if [ ! $1 ]; then

   echo "Hostname not given. Exiting."
   exit 1
fi

pacman -Syy
pacman -Syu zsh vim

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

#enable network services
systemctl enable systemd-resolved systemd-networkd
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

#install and set bootloader
pacman -S gummiboot
gummiboot install

#configure the repos
cp etc/pacman.conf /etc/pacman.conf
pacman-key -r 962dde58
pacman-key --lsign-key 962dde58

pacman -Syy

#install the rest of the system
pacman -S --needed --noconfirm $(cat native_packages.txt)
wget https://aur.archlinux.org/packages/co/cower/cower.tar.gz
cower -d pacaur
cd pacaur 
makepkg -si --noconfirm
cd ..

pacman -S --noconfirm infinality-bundle ibfonts-meta-base infinality-bundle-multilib 
pacaur -S --noconfirm --noedit $(cat aur_packages.txt)

################do user stuff#############################

visudo #add me to sudoers
passwd #set root passwd

groupadd sambashare  #great sambshare group

#add me and smbguest
useradd -m -G wheel,power,storage,audio,network,mail -s /usr/bin/zsh christian
useradd -C "Samba Guest" -d /dev/null -s /bin/false smbguest

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
cat fstab | grep samba >> /etc/fstab

###################create initramfs and enable services#######
mkinitcpio -p linux
systemctl enable gdm plexmediaserver sshd transmission smbd nmbd

exit 0
