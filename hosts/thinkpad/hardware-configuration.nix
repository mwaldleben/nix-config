{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /mnt
    mount -t btrfs /dev/mapper/enc /mnt

    echo "Cleaning root subvolume"
    btrfs subvolume list -o "/mnt/root" | cut -f9 -d ' ' |
    while read -r subvolume; do
      btrfs subvolume delete "/mnt/$subvolume"
      done && btrfs subvolume delete /mnt/root

    echo "Restoring blank subvolume"
    btrfs subvolume snapshot /mnt/root-blank /mnt/root
  '';
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-label/root_enc";

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/a3e87481-1bbd-4c2c-a1cd-2aef3ecdc742";
      fsType = "btrfs";
      options = [ "subvol=root,compress=zstd" ];
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=nix,compress=zstd,noatime" ];
    };

    "/persist" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=persist,compress=zstd" ];
      neededForBoot = true;
    };

    "/swap" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };
  };

  swapDevices = [{ device = "/swap/swapfile"; }];

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true;
}
