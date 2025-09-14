#!/bin/sh

# ../systems/base/base.sh
# ../systems/wm/wm.sh

sudo xbps-install -y void-repo-nonfree intel-ucode

sudo xbps-install -y brightnessctl kanshi

sudo xbps-install -y mesa-dri vulkan-loader mesa-vulkan-intel intel-media-driver

sudo xbps-install -y iwd dbus
sudo ln -sf /etc/sv/dbus /var/service
sudo ln -sf /etc/sv/iwd /var/service
sudo unlink /var/service/wpa_supplicant

# TODO: install tlp
