{ config, ... }:
{
  services = {
    syncthing = {
      enable = true;
      extraOptions = [
        "--config=${config.home.homeDirectory}/.config/syncthing"
        "--data=${config.home.homeDirectory}/.config/syncthing/db"
        "--no-default-folder"
      ];
      tray = {
        enable = true;
        command = "syncthingtray --config-dir-path=${config.home.homeDirectory}/.config/syncthing";
      };
    };
  };
}
