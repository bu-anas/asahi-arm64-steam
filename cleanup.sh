#!/bin/bash


while true; do
read -p "This script fully removes both the zip and installed/extracted steam files. Are you sure you want to continue? (y/n) " choice
case "${choice,,}" in
    y|yes )
    rm -rf ~/.local/share/Steam ~/.steam ~/steam_aarch64/GE-Proton*.tar.gz ~/steam_aarch64/bins_linuxarm64_linuxarm64.zip
        break ;;
    n|no ) 
        exit 0 ;;
    esac
done
