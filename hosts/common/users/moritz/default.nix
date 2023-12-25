{ pkgs, ... }: {
  users.users.moritz = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    packages = [ pkgs.home-manager ];
    password = "test";
  };

  # no password for sudo commands
  security.sudo.extraRules = [{
    users = [ "moritz" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
  }];

  # invalid password fix for swaylock, https://github.com/NixOS/nixpkgs/issues/158025
  security.pam.services.swaylock = { };
}
