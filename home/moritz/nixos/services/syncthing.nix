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
    };
  };

  home.persistence = {
    "/persist/home/${config.home.username}".directories = [ ".config/syncthing" ];
  };
}
