{ config, ... }:
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${config.wallpaper}
    wallpaper = eDP-1,${config.wallpaper}
    wallpaper = HDMI-A-2,${config.wallpaper}
    splash = false
  '';
}
