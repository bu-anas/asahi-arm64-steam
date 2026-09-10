#!/bin/bash

### SPEICAL THANKS TO
# 1. u/RrOoSsSsOo and their post on getting the arm build of steam. https://www.reddit.com/r/AsahiLinux/comments/1tk6zoe/steam_native_arm_aarch64_on_asahi_linux_fedora/
# 2. I will use an older static link using a specific old steam version of the arm64 in which it will automatically update, if you want to grab the latest build look into both de-wim's and ubuntu asahi steam install scripts
# Check if the target installation folder does NOT exist

set -eo pipefail

while true ; do
read -p "Hi, this script utilizes u/RrOoSsSsOo's reddit post to get the steam arm64 beta installed. are you sure you want to continue? (y/n): " choice
case "${choice,,}" in
    y|yes ) 
        break ;;
    n|no ) 
        exit 0 ;;
    esac
done

if [ ! -f "bins_linuxarm64_linuxarm64.zip" ]; then
echo "installing steam build"
wget https://client-update.steamstatic.com/bins_linuxarm64_linuxarm64.zip.0f11199e9a58a0ec4aab3833152ada1b2e56c846
mv bins_linuxarm64_linuxarm64.zip.0f11199e9a58a0ec4aab3833152ada1b2e56c846 bins_linuxarm64_linuxarm64.zip 
else
  echo "Steam build is already installed"
  echo -n "extracting in: "
  for x in {3..1}; do
  printf "%d..." "$x"
  sleep 1
  done
fi


mkdir -p ~/.local/share/Steam/
unzip bins_linuxarm64_linuxarm64.zip -d ~/.local/share/Steam/

mkdir -p ~/.local/share/Steam/package && echo publicbeta > ~/.local/share/Steam/package/beta

chmod -R u+rwx ~/.local/share/Steam/steamrtarm64/

sudo ln -sf /usr/lib64/libvpx.so.9 /usr/lib64/libvpx.so.6

mkdir -p ~/.steam
ln -sf ~/.local/share/Steam ~/.steam/steam
ln -sf ~/.local/share/Steam ~/.steam/root
ln -sf ~/.local/share/Steam/linuxarm64 ~/.steam/sdkarm64

sudo dnf install gtk2 fex-emu
