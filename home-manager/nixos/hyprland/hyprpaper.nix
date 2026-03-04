{ ... }:
let
  wallpaper = ../../wallpapers/default.jpg;
in
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = ,${wallpaper}
    splash = false
  '';
}
