#!/bin/sh -x

if test "$1" = ""; then
	printf "Please provide the hostname of the system you want to install void to as the first and only argument\n"
	exit
fi

my_hostname="$1"

mount -m -L "${my_hostname}R" /mnt
mount -m -L "${my_hostname}H" /mnt/home
mount -m PARTLABEL="${my_hostname}Esp" /mnt/esp

mkswap -U clear --size 4G --file /mnt/swapfile
swapon /mnt/swapfile

mkdir -p /mnt/var/db/xbps/keys
cp /var/db/xbps/keys/* /mnt/var/db/xbps/keys/

# Dracut need objcopy from the clang package to make a UKI
xbps-install -Sy -R https://repo-default.voidlinux.org/current -r /mnt \
	base-minimal base-files linux \
	ncurses libgcc file less util-linux man-pages mdocml xfsprogs dosfstools \
	kbd tzdata pciutils usbutils openssh dhcpcd iproute2 iputils xbps neovim \
	wifi-firmware traceroute ethtool kmod acpid eudev runit-void removed-packages \
	opendoas iwd dbus \
	cryptsetup lvm2 dracut \
	clang systemd-boot-efistub sbctl efibootmgr

xgenfstab /mnt > /mnt/etc/fstab

xchroot /mnt chown root:root /
xchroot /mnt chmod 755 /
xchroot /mnt passwd root
xchroot /mnt useradd -G wheel user
xchroot /mnt passwd user

echo "permit keepenv persist :wheel" > /mnt/etc/doas.conf
xchroot /mnt ln -s /usr/bin/doas /usr/bin/sudo

echo "$my_hostname" > /mnt/etc/hostname

xchroot /mnt ln -s /etc/sv/dhcpcd/ /var/service/

echo "LANG=en_US.UTF-8" > /mnt/etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /mnt/etc/default/libc-locales
xchroot /mnt xbps-reconfigure -f glibc-locales

root_uuid="$(blkid -o value -s UUID -t LABEL="${my_hostname}R")"
luks_uuid="$(blkid -o value -s UUID -t PARTLABEL="${my_hostname}Luks")"
kernel_cmdline="quiet root=UUID=$root_uuid rd.luks.uuid=$luks_uuid rd.lvm.vg=${my_hostname}_system"
mkdir -p /mnt/etc/dracut.conf.d/
printf 'uefi=yes\nkernel_cmdline="%s"\n' "$kernel_cmdline" > /mnt/etc/dracut.conf.d/uki.conf
mkdir -p /mnt/esp/EFI/BOOT
linux_version="$(xchroot /mnt xbps-query --regex -s '^linux[0-9.]+-[0-9._]+' | grep -Eo '([0-9]+\.){2}[0-9_]+')"
xchroot /mnt dracut --force --uefi /esp/EFI/BOOT/linux_"${linux_version}".efi --kver "$linux_version"

esp_partition="$(blkid -o device -t PARTLABEL="${my_hostname}Esp")"
system_disk="/dev/$(lsblk -no PKNAME "$esp_partition")"
xchroot /mnt efibootmgr --create \
	--disk "$system_disk" \
	--loader /EFI/BOOT/linux_"${linux_version}".efi \
	--label "Void Linux $linux_version"

mkdir -p /mnt/home/user/code
cp -r ~/voidrice /mnt/home/user/code/voidrice

umount -R /mnt
reboot
