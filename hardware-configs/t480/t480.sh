#!/bin/sh

sudo xbps-install -y void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -Sy

sudo xbps-install -y intel-ucode sof-firmware

sudo xbps-install -y brightnessctl kanshi

sudo xbps-install -y mesa-dri vulkan-loader mesa-vulkan-intel intel-media-driver

sudo xbps-install -y nvidia nvidia-libs-32bit

# The default config is good enough for this laptop
sudo xbps-install -y tlp
sudo ln -sf /etc/sv/tlp/ /var/service/

sudo xbps-install -y dbus iwd
sudo ln -sf /etc/sv/dbus/ /var/service/
sudo ln -sf /etc/sv/iwd/ /var/service/
