{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Liberation Sans"
        "Noto Color Emoji"
      ];
      serif = [
        "Liberation Serif"
        "Noto Color Emoji"
      ];
      monospace = [
        "Hack Nerd Font Mono"
        "Noto Color Emoji"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  home.packages = [
    pkgs.nerd-fonts.hack
    pkgs.liberation_ttf
    pkgs.noto-fonts-color-emoji
  ];
}
