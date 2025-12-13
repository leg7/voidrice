#!/bin/sh

sudo xbps-install -y void-repo-nonfree intel-ucode sof-firmware

sudo xbps-install -y brightnessctl kanshi

sudo xbps-install -y mesa-dri vulkan-loader mesa-vulkan-intel

# Hardware acceleration
sudo xbps-install -y intel-media-driver libva-utils

sudo xbps-install -y bolt

# The default config is good enough for this laptop
sudo xbps-install -y tlp
sudo ln -sf /etc/sv/tlp/ /var/service/

sudo xbps-install -y iwd dbus
sudo ln -sf /etc/sv/dbus/ /var/service/
sudo ln -sf /etc/sv/iwd/ /var/service/

(
	cd ../../software-configs/wm || exit
	./wm.sh
)
