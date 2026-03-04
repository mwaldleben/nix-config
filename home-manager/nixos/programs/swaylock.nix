{ pkgs, ... }:
let
  wallpaper = ../../wallpapers/default.jpg;
in
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      effect-blur = "20x2";

      clock = true;
      timestr = "%H:%M";
      datestr = "%a %d %b %Y";

      font = "Hack Nerd Font";
      font-size = 40;

      image = "${wallpaper}";

      line-uses-inside = true;
      disable-caps-lock-text = true;
      indicator-caps-lock = true;
      indicator-radius = 180;
      indicator-thickness = 6;
      indicator-idle-visible = true;
      hide-keyboard-layout = true;
    };
  };
}
