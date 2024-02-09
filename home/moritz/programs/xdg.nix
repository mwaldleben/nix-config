{ inputs, config, pkgs, ... }: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = "nvim.desktop";
      "application/pdf" = "zathura.desktop";
      "image/*" = "imv.desktop";
      "audio/*" = "mpv.desktop";
      "video/*" = "mpv.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };
    associations = {
      added = {
        "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
        "image/*" = "imv.desktop";
        "audio/*" = "mpv.desktop";
        "video/*" = "mpv.desktop";
      };
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
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/downloads";
        XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [ inputs.hyprland.packages.${pkgs.system}.hyprland ];
  };

  home.packages = [ pkgs.xdg-utils ];
}
