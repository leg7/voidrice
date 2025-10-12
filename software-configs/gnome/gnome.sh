#!/bin/sh

sudo xbps-install -y dbus
sudo ln -sf /etc/sv/dbus/ /var/service/

sudo xbps-install -y xf86-input-evdev xorg-server-xwayland gnome
sudo ln -sf /etc/sv/gdm/ /var/service/

sudo xbps-install -y firefox libreoffice

sudo xbps-install -y pipewire wireplumber
sudo usermod -aG audio user
sudo ln -sf /usr/share/applications/pipewire.desktop ~/.config/autostart/
sudo ln -sf /usr/share/applications/wireplumber.desktop ~/.config/autostart/

stow -R --no-folding --dir ./files -t ~ home
sudo stow -R --no-folding --dir ./files -t / root
