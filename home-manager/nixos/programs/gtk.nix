{ pkgs, ... }:
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
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  home.packages = with pkgs; [
    gnome-themes-extra
  ];
}
