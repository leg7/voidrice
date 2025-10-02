#!/bin/sh

sudo xbps-install -Sy

sudo xbps-install -y font-spleen
echo 'FONT="spleen-12x24"' | sudo tee -a /etc/rc.conf
setfont spleen-12x24

sudo xbps-install -y acpi
sudo ln -sf /etc/sv/acpid/ /var/service

# Logging

sudo xbps-install -y socklog socklog-void
sudo ln -sf /etc/sv/socklog-unix/ /var/service
sudo ln -sf /etc/sv/nanoklogd/ /var/service

# Date and time

sudo ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

sudo xbps-install -y openntpd
sudo ln -sf /etc/sv/openntpd/ /var/service

# Network

sudo xbps-install -y dhcpcd
sudo ln -sf /etc/sv/dhcpcd /var/service

# Firewall

sudo xbps-install -y nftables
sudo ln -sf /etc/sv/nftables/ /var/service/

# Must have

sudo xbps-install -y \
	llvm19 shellcheck \
	neovim \
	task \
	tree fzf fd ripgrep tealdeer xdg-utils \
	bottom \
	p7zip wget curl \
	git \
	fish-shell starship \
	stow \
	rsync

user_login_shell="$(getent passwd user | cut -d: -f7)"
if test "$user_login_shell" != "/usr/bin/fish"; then
	chsh -s /usr/bin/fish
fi

root_login_shell="$(getent passwd user | cut -d: -f7)"
if test "$root_login_shell" != "/usr/bin/fish"; then
	sudo chsh -s /usr/bin/fish
fi

sudo xbps-install -y keyd
sudo ln -sf /etc/sv/keyd/ /var/service

# TODO: Schedule fstrim

stow -R --no-folding --dir ./files -t ~ home
sudo stow -R --no-folding --dir ./files -t / root
