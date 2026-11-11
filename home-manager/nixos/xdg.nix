{
  config,
  lib,
  pkgs,
  ...
}:
let
  openWith = app: types: lib.genAttrs (lib.splitString " " types) (_: app);
in
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications =
      openWith "imv.desktop" "image/png image/jpeg image/gif image/webp"
      // openWith "mpv.desktop" "audio/mpeg audio/flac audio/ogg video/mp4 video/webm video/x-matroska"
      // {
        "text/plain" = "nvim.desktop";
        "application/pdf" = "zathura.desktop";
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
      };
    associations.added = {
      "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/downloads";
      download = "${config.home.homeDirectory}/downloads";
      documents = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      publicShare = "${config.home.homeDirectory}/downloads";
      templates = "${config.home.homeDirectory}/downloads";
      videos = "${config.home.homeDirectory}/downloads";
      extraConfig = {
        SCREENSHOTS = "${config.home.homeDirectory}/downloads";
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [ pkgs.hyprland ];
  };

  home.packages = [ pkgs.xdg-utils ];
}
