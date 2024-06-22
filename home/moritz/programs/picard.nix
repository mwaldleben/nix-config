{ config, pkgs, ... }:
{
  home.packages = [ pkgs.picard ];

  home.persistence = {
    "/persist/home/${config.home.username}".directories = [ ".config/MusicBrainz" ];
  };
}
