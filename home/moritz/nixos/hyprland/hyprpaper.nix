{ config, pkgs, ... }:
let
  primary = builtins.elemAt config.monitors 0;
  secondary = builtins.elemAt config.monitors 1;
in
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${config.wallpaper}
    wallpaper = ${primary.name},${config.wallpaper}
    wallpaper = ${secondary.name},${config.wallpaper}
    splash = false
  '';
}
