#!/bin/bash

set -eo pipefail
while true ; do
read -p "This script will install the latest proton-ge version. Do you want to continue? (y/n): " choice
case "${choice,,}" in
    y|yes ) 
        break ;;
    n|no ) 
        exit 0 ;;
    esac
done

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
