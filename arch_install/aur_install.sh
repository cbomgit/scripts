#!/bin/bash

wget https://aur.archlinux.org/packages/co/cower/cower.tar.gz
tar -xf cower
cd cower
makepkg -si

cd ..

cower -d pacaur
cd pacaur
makepkg -si

pacaur -S $(cat /scripts/arch_install/aur_packages.txt)
