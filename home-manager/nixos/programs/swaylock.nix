{ config, pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      effect-blur = "20x2";

      clock = true;
      timestr = "%H:%M";
      datestr = "%a %d %b %Y";

      font = config.fontProfiles.monospace.family;
      font-size = 40;

      image = "${config.wallpaper}";

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
