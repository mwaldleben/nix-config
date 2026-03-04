{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./catppuccin.nix
  ];

  # packages without setup
  home.packages = with pkgs; [
    # cli and utils
    nerd-fonts.hack
  ];
}
