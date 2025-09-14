#!/bin/sh

xbps-install -y font-spleen
echo 'FONT="spleen-12x24"' >> /etc/rc.conf
setfont spleen-12x24

# Logging

xbps-install -y socklog
ln -sf /etc/sv/socklog-unix/ /var/service
ln -sf /etc/sv/nanoklogd/ /var/service

# Date and time

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

xbps-install -y openntpd
ln -sf /etc/sv/openntpd/ /var/service

# Network

xbps-install -y dhcpcd
ln -sf /etc/sv/dhcpcd /var/service

# TODO: Configure nftables firewall

# Must have
xbps-install -y \
	clang shellcheck \
	neovim \
	task \
	tree fzf fd ripgrep tealdeer xdg-utils \
	bottom \
	p7zip wget curl \
	git \
	zsh starship \
	keyd

# TODO: Setup keyd
# TODO: Setup zsh
# TODO: Setup starship

# change default dracut reconfigure thing

# Schedule fstrim








