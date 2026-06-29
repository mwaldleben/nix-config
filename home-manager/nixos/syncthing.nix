{ config, ... }:
{
  services = {
    syncthing = {
      enable = true;
      extraOptions = [
        "--config=${config.home.homeDirectory}/.config/syncthing"
        "--data=${config.home.homeDirectory}/.config/syncthing/db"
      ];
      tray = {
        enable = true;
        command = "syncthingtray --wait --config-dir-path=${config.home.homeDirectory}/.config/syncthing";
      };
    };
  };
}
