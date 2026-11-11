{ config, pkgs, ... }:
let
  inherit (config.catppuccin) flavor accent;
  catppuccin-gtk = pkgs.catppuccin-gtk.override {
    accents = [ accent ];
    variant = flavor;
  };
  theme = "catppuccin-${flavor}-${accent}-standard";
in
{
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
  };
  gtk = {
    enable = true;
    font = {
      name = "Liberation Sans";
      size = 11;
    };
    colorScheme = "dark";
    theme = {
      name = theme;
      package = catppuccin-gtk;
    };
  };

  # GTK4 / libadwaita theming (Lollypop, etc.)
  xdg.configFile."gtk-4.0/gtk.css".source = "${catppuccin-gtk}/share/themes/${theme}/gtk-4.0/gtk.css";
  xdg.configFile."gtk-4.0/gtk-dark.css".source =
    "${catppuccin-gtk}/share/themes/${theme}/gtk-4.0/gtk-dark.css";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
