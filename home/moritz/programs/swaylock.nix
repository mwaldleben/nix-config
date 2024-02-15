{ config, pkgs, ... }:
let inherit (config.colorscheme) palette;
in {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      effect-blur = "20x2";
      # fade-in = 1; # very laggy

      clock = true;
      timestr = "%H:%M";
      datestr = "%a %d %b %Y";

      font = config.fontProfiles.monospace.family;
      font-size = 37;

      image = "${config.wallpaper}";

      line-uses-inside = true;
      disable-caps-lock-text = true;
      indicator-caps-lock = true;
      indicator-radius = 180;
      indicator-thickness = 6;
      indicator-idle-visible = true;
      hide-keyboard-layout = true;

      bs-hl-color = "${palette.base08}";
      caps-lock-bs-hl-color = "${palette.base08}";
      caps-lock-key-hl-color = "${palette.base08}";
      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-caps-lock-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";
      key-hl-color = "8caaee";
      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = "";
      line-color = "00000000";
      line-clear-color = "00000000";
      line-caps-lock-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      ring-color = "${palette.base05}";
      ring-clear-color = "${palette.base08}";
      ring-caps-lock-color = "${palette.base08}";
      ring-ver-color = "${palette.base0D}";
      ring-wrong-color = "${palette.base08}";
      separator-color = "00000000";
      text-color = "${palette.base05}";
      text-clear-color = "${palette.base0D}";
      text-caps-lock-color = "${palette.base08}";
      text-ver-color = "${palette.base0D}";
      text-wrong-color = "${palette.base08}";
    };
  };
}
