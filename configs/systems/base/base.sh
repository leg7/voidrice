#!/bin/sh

sudo xbps-install -Sy

sudo xbps-install -y font-spleen
echo 'FONT="spleen-12x24"' | sudo tee -a /etc/rc.conf
setfont spleen-12x24

sudo xbps-install -y acpi
sudo ln -sf /etc/sv/acpid/ /var/service

# Logging

sudo xbps-install -y socklog
sudo ln -sf /etc/sv/socklog-unix/ /var/service
sudo ln -sf /etc/sv/nanoklogd/ /var/service

# Date and time

sudo ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

sudo xbps-install -y openntpd
sudo ln -sf /etc/sv/openntpd/ /var/service

# Network

sudo xbps-install -y dhcpcd
sudo ln -sf /etc/sv/dhcpcd /var/service

# TODO: Configure nftables firewall

# Must have
sudo xbps-install -y \
	clang shellcheck \
	neovim \
	task \
	tree fzf fd ripgrep tealdeer xdg-utils \
	bottom \
	p7zip wget curl \
	git \
	zsh starship \
	rsync

sudo xbps-install -y keyd
sudo ln -sf /etc/sv/keyd/ /var/service

# TODO: Setup zsh
# TODO: Setup starship

# change default dracut reconfigure thing

# Schedule fstrim

rsync -a ./files/home/ ~
sudo rsync -a ./files/root/ /
