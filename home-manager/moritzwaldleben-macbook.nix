{ config, pkgs, ... }:
{
  imports = [
    ./common/catppuccin.nix
    ./common/firefox.nix
    ./common/font.nix
    ./common/ghostty.nix
    ./common/git.nix
    ./common/github.nix
    ./common/neovim.nix
    ./common/ssh.nix
    ./common/uv.nix
    ./common/zellij.nix
    ./common/zsh.nix
  ];

  programs = {
    home-manager.enable = true;
  };

  # packages without setup
  home.packages = with pkgs; [
    # cli and utils
    nodejs
  ];

  home = {
    username = "moritzwaldleben";
    homeDirectory = "/Users/${config.home.username}";
    stateVersion = "26.05";
  };
}
