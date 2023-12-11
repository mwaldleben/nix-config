{ config, ... }:
let inherit (config.colorscheme) colors;
in {
  programs.imv = {
    enable = true;
    settings = {
      options = {
        background = "${colors.base00}";
        overlay_font = "Monospace:13";
        overlay_text_color = "${colors.base05}";
        overlay_background_color = "${colors.base02}";
        overlay_background_alpha = "ff";
        overlay_position_bottom = true;
      };
    };
  };
}
