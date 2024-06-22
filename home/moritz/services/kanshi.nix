{ config, pkgs, ... }:
let
  primary = builtins.elemAt config.monitors 0;
  secondary = builtins.elemAt config.monitors 1;

  swapactiveworkspaces = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch swapactiveworkspaces 0 1";
in
{
  home.packages = [ pkgs.kanshi ];
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    settings = [
      {
        profile.name = "default";
        profile.outputs = [
          {
            criteria = "${primary.name}";
            scale = 1.0;
            status = "enable";
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "${secondary.name}";
            scale = 1.0;
            status = "enable";
          }
          {
            criteria = "${primary.name}";
            status = "disable";
          }
        ];
        profile.exec = "${swapactiveworkspaces}";
      }
    ];
  };
}
