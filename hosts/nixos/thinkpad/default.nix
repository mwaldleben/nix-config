{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../common/audio.nix
    ../common/auto-epp.nix
    ../common/blueman.nix
    ../common/dconf.nix
    ../common/fwudp.nix
    ../common/impermanence.nix
    ../common/locale.nix
    ../common/networking.nix
    ../common/nix.nix
    ../common/pcscd.nix
    ../common/sops.nix
    ../common/zsh.nix
    ../common/udisks2.nix
    ../common/users/moritz
  ];

  users.mutableUsers = false;

  users.users.root.hashedPasswordFile = config.sops.secrets.root-password.path;
  sops.secrets.root-password = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };

  environment.systemPackages = with pkgs; [
    git
    gcc
    neovim
    python3
    ripgrep
    sops
    srm
    ssh-to-age
    trash-cli
    unzip
    wget
    zip
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  networking = {
    hostName = "thinkpad";
  };

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        enable = true;
        configurationLimit = 4;
      };
      timeout = 1;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware.bluetooth.enable = true;
  hardware.graphics.enable = true;

  programs.nix-ld.enable = true;

  # lid settings
  services.logind = {
    settings = {
      Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "suspend";
      };
    };
  };

  system.stateVersion = "25.11";
}
