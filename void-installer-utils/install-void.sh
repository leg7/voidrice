#!/bin/sh

# TODO: Check if hostname is given

hostname="$1"

mount -m -L "${hostname}R" /mnt
mount -m -L "${hostname}H" /mnt/home
mount -m PARTLABEL="${hostname}Esp" /mnt/esp

xbps-install -Sy mkswap
mkswap -U clear --size 4G --file /mnt/swapfile
swapon /mnt/swapfile

mkdir -p /mnt/var/db/xbps/keys
cp /var/db/xbps/keys/* /mnt/var/db/xbps/keys/

# Dracut need objcopy from the clang package to make a UKI
xbps-install -Sy -R https://repo-default.voidlinux.org/current -r /mnt \
	base-minimal base-files \
	ncurses libgcc file less man-pages xfsprogs dosfstools \ # Packages from base-system that are missing from base-minimal
	tzdata pciutils usbutils openssh dhcpcd kbd iproute2 iputils xbps neovim \
	wifi-firmware traceroute ethtool kmod acpid eudev runit-void removed-packages \
	doas iwd \
	cryptsetup lvm2 \
	clang systemd-boot-efistub sbctl efibootmgr

xgenfstab /mnt > /mnt/etc/fstab

root_uuid="$(blkid -o value -s UUID -t LABEL="${hostname}R")"
luks_uuid="$(blkid -o value -s UUID -t PARTLABEL="${hostname}Luks")"
printf 'uefi=yes\nkernel_cmdline="quiet root=UUID=%s rd.luks.uuid=%s rd.lvm.vg=%s"\n' "$root_uuid" "$luks_uuid" "${hostname}_system" > /mnt/etc/dracut.conf.d/uki.conf

xchroot /mnt chown root:root /
xchroot /mnt chmod 755 /
xchroot /mnt passwd root
xchroot /mnt useradd -G wheel user
xchroot /mnt passwd user
xchroot /mnt echo "permit keepenv persist :wheel" > /etc/doas.conf
xchroot /mnt echo "$hostname" > /etc/hostname
xchroot /mnt echo "LANG=en_US.UTF-8" > /etc/locale.conf
xchroot /mnt echo "en_US.UTF-8 UTF-8" >> /etc/default/libc-locales
xchroot /mnt xbps-reconfigure -f glibc-locales
xchroot /mnt xbps-reconfigure -fa
xchroot /mnt mkdir -p /esp/EFI/BOOT
xchroot /mnt dracut --force --uefi /esp/EFI/BOOT/BOOTx64.efi --kver 6.12.45_1

system_disk="$(blkid -o value -s UUID -t PARTLABEL="${hostname}Esp")"
xchroot /mnt efibootmgr --create --disk "$system_disk" --loader /esp/EFI/BOOT/BOOTx64.efi --label "Void Linux"

umount -R /mnt
reboot
