{ config, pkgs, ... }:
{
  imports = [
    ./common/catppuccin.nix
    ./common/claude-code.nix
    ./common/firefox.nix
    ./common/font.nix
    ./common/ghostty.nix
    ./common/git.nix
    ./common/github.nix
    ./common/neovim.nix
    ./common/tmux.nix
    ./common/ssh.nix
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
    stateVersion = "25.11";
  };
}
