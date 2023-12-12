{ pkgs, config, ... }:
let
  swaylock = "${config.programs.swaylock.package}/bin/swaylock";
  systemctl = "${pkgs.systemd}/bin/systemctl";
in {
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 900;
        command = "${swaylock} --daemonize";
      }
      {
        timeout = 1800;
        command = "${systemctl} suspend";
      }
    ];
    events = [{
      event = "before-sleep";
      command = "${swaylock}";
    }];
  };
}
