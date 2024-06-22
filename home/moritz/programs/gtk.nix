{ pkgs, config, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Frappe-Dark-Cursors";
    package = pkgs.catppuccin-cursors.frappeDark;
    size = 32;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Frappe-Compact-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        tweaks = [ "normal" ];
        size = "compact";
        variant = "frappe";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "${config.fontProfiles.regular.family} Sans";
      size = 11;
    };
  };
}
