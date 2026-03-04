{ inputs, pkgs, ... }:
{
  imports = [
    ./common/git.nix
    ./common/neovim.nix
    ./common/tmux.nix
    ./common/todo-txt.nix
    ./common/zsh.nix
    ./darwin/default.nix
    ./darwin/programs
  ];

  wallpaper = ./wallpapers/default.jpg;

  home.packages = with pkgs; [
    # cli and utils
    nerd-fonts.hack
  ];
}
