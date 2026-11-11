{ pkgs, ... }:
let
  notify-send = "${pkgs.libnotify}/bin/notify-send";
in
{
  services.batsignal = {
    enable = true;
    extraArgs = [
      "-w"
      "20"
      "-c"
      "10"
      "-d"
      "5"
      "-W"
      "Battery is low"
      "-C"
      "Battery is critically low"
      "-D"
      "${notify-send} -a batsignal -u critical -t 0 'Battery is almost empty' 'Hibernating soon'"
    ];
  };
}
