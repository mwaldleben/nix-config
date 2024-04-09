{ config, pkgs, ... }:
let
  primary = builtins.elemAt config.monitors 0;
  secondary = builtins.elemAt config.monitors 1;
  waybar_reload = "${pkgs.systemd}/bin/systemctl --user restart waybar.service";

  hyprland = config.wayland.windowManager.hyprland.package;
  move_workspace = "${hyprland}/bin/hyprctl dispatch workspace 1";
in {
  home.packages = [ pkgs.kanshi ];
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    profiles = {
      # primary monitor 
      default = {
        outputs = [{
          criteria = "${primary.name}";
          scale = 1.0;
          status = "enable";
        }];
        exec = "${move_workspace} && ${waybar_reload}";
      };
      # secondary monitor
      docked = {
        outputs = [
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
        exec = "${move_workspace} && ${waybar_reload}";
      };
    };
  };
}
