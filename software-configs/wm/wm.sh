#!/bin/sh

(
	cd ../base || exit
	./base.sh
)

sudo xbps-install -Sy

sudo xbps-install -y void-repo-nonfree

# Graphical wayland stuff

sudo xbps-install -y seatd
sudo ln -sf /etc/sv/seatd /var/service
sudo usermod -aG _seatd user

sudo xbps-install -y qt6-wayland qt5-wayland kwayland

sudo xbps-install -y \
	river xorg-server-xwayland xdg-desktop-portal-gtk yambar fuzzel swayidle swaylock wlogout fnott wlsunset \
	foot firefox imv mpv nemo qalculate-gtk qdirstat gpick syncthing obs  android-file-transfer-linux \
	Signal-Desktop halloy \
	zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps \
	newsboat \
	wl-clipboard xlsclients lswt wlr-randr qrencode swaybg grim slurp satty libnotify \
	mpc helvum pulsemixer easyeffects guitarix2 pamixer \
	adwaita-icon-theme adwaita-qt \
	noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf nerd-fonts-symbols-ttf \

# Gaming
sudo xbps-install -y \
	void-repo-nonfree \
	steam \
	PrismLauncher \
	MangoHud

# TODO: Heroic, cemu, osu lazer, wootility

# Dev tools
sudo xbps-install -y \
	pandoc \
	llvm19 tcc make cmake pkg-config \
	python python3-pip \
	ghc \
	openjdk21 gradle apache-maven \
	neovide \
	task \
	groff sent \
	ImageMagick ffmpeg yt-dlp \
	rust cargo \
	go gopls \
	jq

# Install rivercarro (not in void repos)

sudo xbps-install -y wayland wayland-devel wayland-protocols wlroots libxkbcommon libevdev pixman pkg-config zig
git clone https://git.sr.ht/~novakane/rivercarro ~/.local/share/rivercarro
(
	cd ~/.local/share/rivercarro || exit
	git checkout v0.5.0
	zig build -Doptimize=ReleaseSafe --prefix ~/.local
)

# Pipewire

sudo xbps-install -y pipewire wireplumber
sudo usermod -aG audio user

# Mpd

sudo xbps-install -y mpd
mkdir -p ~/.local/share/mpd/playlists ~/.local/state/mpd  ~/.local/cache/mpd
cargo install inori

# Bluetooth

sudo xbps-install -y bluez libspa-bluetooth
sudo ln -sf /etc/sv/bluetoothd /var/service

# Transmission

sudo xbps-install -y transmission
sudo xbps-install -y openssl-devel
cargo install rustmission

# Other utilities

cargo install inlyne # inlyne markdown viewer
go install github.com/hhatto/gocloc/cmd/gocloc@latest # lines of code counter

# TODO: Vial, logseq, door-knocker, mime apps, portals

sudo xbps-reconfigure -f fontconfig

stow -R --no-folding --dir ./files -t ~ home
sudo stow -R --no-folding --dir ./files -t / root
