#!/usr/bin/env bash
set -e

### Installation script for NixOS #
# - Excrypted Btrfs filesystem
# - Impermanence setup
printf "### Installation script for NixOS ###\n"

# Set wifi name
ESSID=mywifiname
INTERFACE=wlp1s0
printf "Provid password for wifi $ESSID:\n"
sudo -u nixos wpa_passphrase $ESSID | tee /etc/wpa_supplicant.conf
wpa_supplicant -c /etc/wpa_supplicant.conf -B -i $INTERFACE

# Set disk name 
DISK=nvme0n1
printf "Disk name: ${DISK}\n" 

printf "### Format disk ###\n"
printf "label: gpt\n,550M,U\n,,L\n" | sfdisk /dev/$DISK

printf "### Encrypt root filystem ###\n"
cryptsetup --verify-passphrase --label root_enc -v luksFormat /dev/${DISK}p2 
cryptsetup open /dev/${DISK}p2 enc

printf "### Format and bootloader ###\n"
mkfs.vfat -n boot /dev/${DISK}p1

printf "### Format and mount filesystem (btrfs) ###\n"
mkfs.btrfs /dev/mapper/enc
btrfs filesystem label /dev/mapper/enc root

mkdir -p /mnt
mount -t btrfs /dev/mapper/enc /mnt

btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/nix
btrfs subvolume create /mnt/persist
btrfs subvolume create /mnt/swap
btrfs subvolume snapshot -r /mnt/root /mnt/root-blank

umount /mnt

mount -o subvol=root,compress=zstd /dev/mapper/enc /mnt 
mkdir -p /mnt/nix
mount -o subvol=nix,compress=zstd,noatime /dev/mapper/enc /mnt/nix
mkdir -p /mnt/persist
mount -o subvol=persist,compress=zstd /dev/mapper/enc /mnt/persist

mkdir -p /swap
mount -o subvol=swap /dev/mapper/enc /swap
btrfs filesystem mkswapfile --size 8g --uuid clear /swap/swapfile

mkdir -p /mnt/boot
mount /dev/${DISK}p1 /mnt/boot

printf "### Generate NixOS config ###\n"
nixos-generate-config --root /mnt
