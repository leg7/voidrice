#!/bin/sh

sudo xbps-install -Sy

sudo xbps-install -y void-repo-nonfree

# Graphical wayland stuff

sudo xbps-install -y seatd
sudo ln -sf /etc/sv/seatd /var/service
sudo usermod -aG _seatd user

sudo xbps-install -y qt6-wayland qt5-wayland kwayland

sudo xbps-install -y \
	river xorg-server-xwayland xdg-desktop-portal-gtk yambar fuzzel swayidle swaylock wlogout fnott wlsunset kanshi \
	foot firefox imv mpv zathura nemo qalculate-gtk qdirstat gpick syncthing obs Signal-Desktop halloy android-file-transfer-linux \
	newsboat \
	wl-clipboard xlsclients lswt wlr-randr qrencode swaybg grim slurp satty libnotify \
	mpd mpc helvum pulsemixer easyeffects guitarix2 pamixer \
	adwaita-icon-theme adwaita-qt \
	noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf nerd-fonts-symbols-ttf

# Install rivercarro (not in void repos)

sudo xbps-install -y wayland wayland-devel wayland-protocols wlroots libxkbcommon libevdev pixman pkg-config zig
git clone https://git.sr.ht/~novakane/rivercarro ~/.local/share/rivercarro
cd ~/.local/share/rivercarro
git checkout v0.5.0
zig build -Doptimize=ReleaseSafe --prefix ~/.local
cd -

# Pipewire

sudo xbps-install -y pipewire
mkdir -p /etc/pipewire/pipewire.conf.d
ln -sf /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
ln -sf /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
sudo usermod -aG audio user

# Bluetooth

sudo xbps-install -y bluez libspa-bluetooth
sudo ln -sf /etc/sv/bluetoothd /var/service

# Transmission torrents, vial, logseq, door-knocker, banana cursor, mime apps, portals, xdg-dirs
# autologin

# Gaming
sudo xbps-install -y \
	steam \
	PrismLauncher \
	MangoHud

# Heroic, cemu, osu lazer, wootility

# Dev tools
sudo xbps-install -y \
	pandoc \
	clang \
	python \
	ghc \
	openjdk \
	neovide \
	task \
	groff sent \
	ImageMagick ffmpeg yt-dlp \
	jq

sudo xbps-reconfigure -f fontconfig

cd ./files
stow -R --no-folding -t ~ home
sudo stow -R --no-folding -t / root
