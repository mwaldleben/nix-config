{ inputs, pkgs, ... }:
{
  imports = [
    ./essentials
    ./darwin/default.nix
    ./darwin/programs
  ];

  wallpaper = ./wallpapers/default.jpg;

  home.packages = with pkgs; [
    # cli and utils
    nerd-fonts.hack
  ];
}
