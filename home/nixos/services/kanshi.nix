{ config, pkgs, ... }:
let
  primary = builtins.elemAt config.monitors 0;
  secondary = builtins.elemAt config.monitors 1;
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
            scale = primary.scale;
            status = "enable";
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "${secondary.name}";
            scale = secondary.scale;
            status = "enable";
          }
          {
            criteria = "${primary.name}";
            status = "disable";
          }
        ];
      }
    ];
  };
}
