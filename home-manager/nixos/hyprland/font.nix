{ pkgs, ... }:
{
  fontProfiles = {
    enable = true;
    monospace = {
      family = "Hack Nerd Font";
      package = pkgs.nerd-fonts.hack;
    };
    regular = {
      family = "Liberation";
      package = pkgs.liberation_ttf;
    };
    emoji = {
      family = "Noto Color Emoji";
      package = pkgs.noto-fonts-color-emoji;
    };
  };
}
