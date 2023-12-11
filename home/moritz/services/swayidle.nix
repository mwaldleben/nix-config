{ pkgs, config, ... }:
let
  hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";
  swaylock = "${config.programs.swaylock.package}/bin/swaylock";
  systemctl = "${pkgs.systemd}/bin/systemctl";
in {
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = "${swaylock} --daemonize";
      }
      {
        timeout = 1200;
        command = "${hyprctl} dispatch dpms off";
      }
      {
        timeout = 1800;
        command = "${hyprctl} dispatch dpms on; sleep 1; ${systemctl} suspend";
      }
    ];
    events = [{
      event = "before-sleep";
      command = "${swaylock}";
    }];
  };
}
