{ pkgs, config, ... }:
{
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.frappeBlue;
    name = "Catppucin-cursors-frappeBlue";
    size = 32;
    gtk.enable = true;
  };
  gtk = {
    enable = true;
    font = {
      name = "${config.fontProfiles.regular.family} Sans";
      size = 11;
    };
  };
}
