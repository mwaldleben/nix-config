{ pkgs, ... }:
let
  catppuccin-gtk = pkgs.catppuccin-gtk.override {
    accents = [ "blue" ];
    variant = "frappe";
  };
in
{
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.frappeBlue;
    name = "catppuccin-frappe-blue-cursors";
    size = 32;
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
      name = "catppuccin-frappe-blue-standard";
      package = catppuccin-gtk;
    };
    gtk4.theme = null;
  };

  # GTK4 / libadwaita theming (Lollypop, etc.)
  xdg.configFile."gtk-4.0/gtk.css".source =
    "${catppuccin-gtk}/share/themes/catppuccin-frappe-blue-standard/gtk-4.0/gtk.css";
  xdg.configFile."gtk-4.0/gtk-dark.css".source =
    "${catppuccin-gtk}/share/themes/catppuccin-frappe-blue-standard/gtk-4.0/gtk-dark.css";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
