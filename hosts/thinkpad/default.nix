{ inputs, outputs, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../common/audio.nix
    ../common/blueman.nix
    ../common/dconf.nix
    ../common/impermanence.nix
    ../common/locale.nix
    ../common/networking.nix
    ../common/nix.nix
    ../common/pcscd.nix
    ../common/printing.nix
    ../common/zsh.nix
    ../common/udisks2.nix
    ../common/users/moritz
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users.moritz = import ../../home/moritz/thinkpad.nix;
  };

  # TODO: Use hashed passwords
  users.users.root.password = "test";
  users.mutableUsers = false;

  environment.systemPackages = with pkgs; [
    e2fsprogs # mkfs program
    git
    gcc
    htop
    neovim
    python3
    ripgrep
    trash-cli
    unzip
    wget
    zip
  ];

  nixpkgs = { config = { allowUnfree = true; }; };

  networking = { hostName = "thinkpad"; };

  boot = {
    loader = {
      efi = { canTouchEfiVariables = true; };
      systemd-boot = {
        enable = true;
        configurationLimit = 4;
      };
      timeout = 1;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware.bluetooth.enable = true;
  hardware.opengl.enable = true;

  programs.nix-ld.enable = true;

  # lid settings
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
  };

  # portals
  xdg.portal.config = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  system.stateVersion = "23.11";
}
