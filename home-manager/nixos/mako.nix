{ config, lib, ... }:
let
  palette =
    (lib.importJSON "${config.catppuccin.sources.palette}/palette.json")
    .${config.catppuccin.flavor}.colors;
  color = name: palette.${name}.hex;
in
{
  catppuccin.mako.enable = false;

  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      margin = 8;
      outer-margin = 8;
      border-radius = 8;
      border-size = 2;
      max-icon-size = 32;
      default-timeout = 5000;
      background-color = color "base";
      text-color = color "text";
      border-color = color config.catppuccin.accent;
      progress-color = "over ${color "surface1"}";
      "urgency=high" = {
        border-color = color "peach";
      };
    };
  };
}
