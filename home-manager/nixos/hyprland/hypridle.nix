{ pkgs, config, ... }:

let
  hyprlock = "${config.programs.hyprlock.package}/bin/hyprlock";
  systemctl = "${pkgs.systemd}/bin/systemctl";
in
{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || ${hyprlock}";
        before_sleep_cmd = "${hyprlock}";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "${hyprlock}";
        }

        {
          timeout = 1800;
          on-timeout = "${systemctl} suspend";
        }
      ];
    };
  };
}
