{
  lib,
  modulesPath,
  utils,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "thunderbolt"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.initrd.systemd = {
    enable = true;
    services.wipe-file-systems = {
      unitConfig.DefaultDependencies = false;
      serviceConfig.Type = "oneshot";
      requiredBy = [ "initrd.target" ];
      before = [ "sysroot.mount" ];

      requires = [ "${utils.escapeSystemdPath "/dev/by-label/root"}.device" ];
      after = [
        "${utils.escapeSystemdPath "/dev/by-label/root"}.device"
        "local-fs-pre.target"
      ];

      script = ''
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
    };
  };
  boot.kernelModules = [
    "kvm-amd"
    "amd-pstate"
  ];
  boot.kernelParams = [
    "initcall_blacklist=acpi_cpufreq_init"
    "acpi_backlight=native"
    "apm=power_off"
  ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/root";
    fsType = "btrfs";
    options = [
      "subvol=root"
      "compress=zstd"
    ];
  };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-label/root_enc";

  fileSystems."/nix" = {
    device = "/dev/disk/by-label/root";
    fsType = "btrfs";
    options = [
      "subvol=nix"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-label/root";
    fsType = "btrfs";
    options = [
      "subvol=persist"
      "compress=zstd"
    ];
    neededForBoot = true;
  };

  fileSystems."/swap" = {
    device = "/dev/disk/by-label/root";
    fsType = "btrfs";
    options = [
      "subvol=swap"
      "noatime"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true;
}
