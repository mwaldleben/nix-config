{ config, pkgs, ... }:
{
  users.users.moritz = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "docker"
    ];
    packages = [ pkgs.home-manager ];
    hashedPasswordFile = config.sops.secrets.moritz-password.path;
  };

  sops.secrets.moritz-password = {
    sopsFile = ../../../thinkpad/secrets.yaml;
    neededForUsers = true;
  };

  # no password for sudo commands
  security.sudo.extraRules = [
    {
      users = [ "moritz" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  # invalid password fix for swaylock, https://github.com/NixOS/nixpkgs/issues/158025
  security.pam.services.swaylock = { };
}
