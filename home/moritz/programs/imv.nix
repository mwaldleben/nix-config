{ config, ... }:
let
  inherit (config.colorscheme) palette;
in
{
  programs.imv = {
    enable = true;
    settings = {
      options = {
        background = "${palette.base00}";
        overlay_font = "Monospace:13";
        overlay_text_color = "${palette.base05}";
        overlay_background_color = "${palette.base02}";
        overlay_background_alpha = "ff";
        overlay_position_bottom = true;
      };
    };
  };
}
