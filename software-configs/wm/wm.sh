#!/bin/sh

(
	cd ../base || exit
	./base.sh
)

sudo xbps-install -y void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -Sy

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
	fuse \
	noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf nerd-fonts-symbols-ttf font-firacode

# Gaming
sudo xbps-install -y \
	PrismLauncher \
	MangoHud \
	libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit libcurl-32bit \
	gamemode \
	steam

# TODO: Heroic, cemu, osu lazer, wootility

# Languages
sudo xbps-install -y \
	llvm19 tcc make cmake pkg-config gdb \
	asm-lsp \
	shellcheck bash-language-server \
	go gopls \
	ghc haskell-language-server \
	zig zls \
	rust cargo rust-analyzer \
	lua lua-language-server \
	python python3-pip \
	openjdk21 gradle apache-maven \
	nodejs pnpm

# Other dev tools
sudo xbps-install -y \
	neovide git curl unzip tar gzip \
	task \
	groff sent pandoc \
	ImageMagick ffmpeg yt-dlp \
	jq

sudo xbps-install -y gdb libX11-devel freetype-devel
git clone --depth=1 https://github.com/nakst/gf.git ~/.local/share/gf
(
	cd ~/.local/share/gf || exit
	cp extensions_v5/*.cpp .
	./build.sh
	cp gf2 ~/.local/bin
)

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

# Music
sudo xbps-install -y mpd rmpc spek-x picard
mkdir -p ~/.local/state/mpd  ~/.local/cache/mpd

# Bluetooth

sudo xbps-install -y bluez libspa-bluetooth bluetui
sudo ln -sf /etc/sv/bluetoothd /var/service

# Transmission

sudo xbps-install -y transmission
sudo xbps-install -y openssl-devel
cargo install rustmission

# Other utilities

go install github.com/hhatto/gocloc/cmd/gocloc@latest # lines of code counter
cargo install inlyne                                  # inlyne markdown viewer
cargo install dysk                                    # more useful df

# TODO: Vial, logseq, door-knocker, mime apps, portals

sudo xbps-reconfigure -f fontconfig

stow -R --no-folding --dir ./files -t ~ home
sudo stow -R --no-folding --dir ./files -t / root
