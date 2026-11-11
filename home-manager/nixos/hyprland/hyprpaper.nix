{ config, lib, ... }:
let
  custom = "${config.home.homeDirectory}/code/nix-config/home-manager/wallpapers/custom.jpg";
  wallpaper = "${config.xdg.dataHome}/wallpaper.jpg";
in
{
  home.activation.wallpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target=${../../wallpapers/default.jpg}
    [ -e "${custom}" ] && target="${custom}"
    run mkdir -p "${config.xdg.dataHome}"
    run ln -sfn "$target" "${wallpaper}"
  '';

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "";
          path = wallpaper;
          fit_mode = "cover";
        }
      ];
    };
  };
}
