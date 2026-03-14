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
    colorScheme = "dark";
  };

  home.packages = with pkgs; [
    gnome-themes-extra
  ];
}
