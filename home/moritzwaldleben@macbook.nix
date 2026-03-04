{ inputs, pkgs, ... }:
{
  imports = [
    ./common
    ./darwin/default.nix
    ./darwin/programs
  ];

  wallpaper = ./wallpapers/default.jpg;

  home.packages = with pkgs; [
    # cli and utils
    nerd-fonts.hack
  ];
}
