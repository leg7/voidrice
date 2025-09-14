#!/bin/sh

# ../systems/base/base.sh
# ../systems/wm/wm.sh

xbps-install -y intel-ucode brightnessctl kanshi

xbps-install -y mesa-dri vulkan-loader mesa-vulkan-intel intel-media-driver

xbps-install -y iwd dbus
ln -sf /etc/sv/dbus /var/service
ln -sf /etc/sv/iwd /var/service
unlink /var/service/wpa_supplicant
xbps-remove -y wpa_supplicant

# TODO: install tlp
