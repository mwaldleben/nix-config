{ config, ... }:
{
  programs.imv = {
    enable = true;
    settings = {
      options = {
        overlay_font = "Monospace:13";
        overlay_background_alpha = "ff";
        overlay_position_bottom = true;
      };
    };
  };
}
