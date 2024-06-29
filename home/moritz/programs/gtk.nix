{ pkgs, config, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    size = 32;
  };
  gtk = {
    enable = true;
    font = {
      name = "${config.fontProfiles.regular.family} Sans";
      size = 11;
    };
  };
}
