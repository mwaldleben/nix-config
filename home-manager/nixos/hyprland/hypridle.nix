{ pkgs, config, ... }:

let
  hyprlock = "${config.programs.hyprlock.package}/bin/hyprlock";
  pidof = "${pkgs.procps}/bin/pidof";
  lock = "${pidof} hyprlock || ${hyprlock}";
  systemctl = "${pkgs.systemd}/bin/systemctl";
in
{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = lock;
        before_sleep_cmd = lock;
      };

      listener = [
        {
          timeout = 900;
          on-timeout = lock;
        }

        {
          timeout = 1800;
          on-timeout = "${systemctl} suspend";
        }
      ];
    };
  };
}
