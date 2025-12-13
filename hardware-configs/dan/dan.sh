#!/bin/sh

# Hardware acceleration
sudo xbps-install -y mesa-vaapi libva-utils

sudo xbps-install -y void-repo-nonfree amdvlk linux-firmware-amd

sudo xbps-install -y mesa-dri vulkan-loader

sudo xbps-install -y iwd dbus
sudo ln -sf /etc/sv/dbus/ /var/service/
sudo ln -sf /etc/sv/iwd/ /var/service/

(
	cd ../../software-configs/wm || exit
	./wm.sh
)
