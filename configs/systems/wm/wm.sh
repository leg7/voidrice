#!/bin/sh

# Graphical wayland stuff

xbps-install -Sy

xbps-install -y void-repo-nonfree

xbps-install -y seatd
ln -sf /etc/sv/seatd /var/service
usermod -aG _seatd user

xbps-install -y qt6-wayland qt5-wayland kwayland
# TODO: SET QT_QPA_PLATFORM=wayland ELM_DISPLAY=wl SDL_VIDEODRIVER=wayland MOZ_ENABLE_WAYLAND=1 XDG_SESSION_TYPE=wayland

xbps-install -y \
	river xorg-server-xwayland xdg-desktop-portal-gtk yambar fuzzel swayidle swaylock wlogout fnott \
	foot firefox imv mpv zathura nemo qalculate-gtk qdirstat gpick syncthing obs Signal-Desktop halloy android-file-transfer-linux \
	newsboat \
	wl-clipboard xlsclients lswt wlr-randr qrencode swaybg grim slurp satty libnotify \
	mpd mpc helvum pulsemixer easyeffects guitarix2 pamixer \
	adwaita-icon-theme adwaita-qt \
	noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf nerd-fonts-symbols-ttf

# Transmission torrents, vial, logseq, rivercarro, door-knocker, banana cursor, mime apps, portals, xdg-dirs, pipewire
# autologin

# Gaming
xbps-install -y \
	steam \
	PrismLauncher \
	MangoHud

# Heroic, cemu, osu lazer, wootility

# Dev tools
xbps-install -y \
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

rsync -a ./files/ ~
