#!/bin/bash

set -eo pipefail
while true ; do
read -p "This script will install the latest proton-ge version, and change the ram compression algorithm from lzo to zstd, and. Do you want to continue? (y/n): " choice
case "${choice,,}" in
    y|yes ) 
        break ;;
    n|no ) 
        exit 0 ;;
    esac
done

while true ; do
read -p "Do you want to install proton-ge or skip to changing ram algorithm  (y/s yes/skip): " choice
case "${choice,,}" in
    y|yes )
    if [ ! -d ~/.steam/root/compatibilitytools.d ]; then
	echo "creating proton directory"
     mkdir -p ~/.steam/root/compatibilitytools.d/
     else
     echo "proton directory is installed. downloading Proton"
     sleep 1
     fi
     
     if [ ! -f GE-Proton*.tar.gz ]; then
     echo "Proton is not installed. installing proton"
     wget https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton11-6/GE-Proton11-6-aarch64.tar.gz
     else
     echo "proton-ge is installed, now extracting"
     tar -xf GE-Proton*.tar.gz -C ~/.steam/root/compatibilitytools.d/
     fi
        exit 0 ;;
    s|skip ) 
        break ;;
    esac
done


echo "first: goto /etc/default/grub and at the end of 'GRUB_CMDLINE_LINUX_DEFAULT=' paste 'zswap.compressor=zstd' "
while true ; do
read -p "Did you do so? (y/n): " choice
case "${choice,,}" in
    y|yes ) 
        break ;;
    n|no ) 
        exit 0 ;;
    esac
done

sudo sh -c 'echo zstd > /sys/module/zswap/parameters/compressor'
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
