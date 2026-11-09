{ pkgs, config, ... }:

let
  hyprlock = "${config.programs.hyprlock.package}/bin/hyprlock";
  hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";
  pidof = "${pkgs.procps}/bin/pidof";
  loginctl = "${pkgs.systemd}/bin/loginctl";
  systemctl = "${pkgs.systemd}/bin/systemctl";
  notify-send = "${pkgs.libnotify}/bin/notify-send";
  dpms = action: "${hyprctl} dispatch 'hl.dsp.dpms({ action = \"${action}\" })'";
in
{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "${pidof} hyprlock || ${hyprlock}";
        before_sleep_cmd = "${loginctl} lock-session";
        after_sleep_cmd = dpms "on";
      };

      listener = [
        {
          timeout = 840;
          on-timeout = "${notify-send} 'Locking in 1 minute'";
        }

        {
          timeout = 900;
          on-timeout = "${loginctl} lock-session";
        }

        {
          timeout = 1200;
          on-timeout = dpms "off";
          on-resume = dpms "on";
        }

        {
          timeout = 1800;
          on-timeout = "${systemctl} suspend";
        }
      ];
    };
  };
}
