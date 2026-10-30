{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./common/catppuccin.nix
    ./common/git.nix
    ./common/herdr.nix
    ./common/neovim.nix
    ./common/uv.nix
    ./common/zsh.nix
  ];

  programs = {
    home-manager.enable = true;
    zsh.shellAliases.hs = lib.mkForce "home-manager switch --flake .#moritz@wsl";

    # different git account, identity kept out of the repo in an unmanaged file
    git = {
      settings = {
        user = lib.mkForce { };
        commit.gpgSign = lib.mkForce false;
      };
      includes = [ { path = "${config.xdg.configHome}/git/identity"; } ];
    };
  };

  # non-nixos linux (single-user nix install, no systemd)
  targets.genericLinux.enable = true;

  # flakes for single-user install (no /etc/nix/nix.conf)
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # packages without setup
  home.packages = with pkgs; [
  ];

  home = {
    username = "moritz";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "26.05";
  };
}
