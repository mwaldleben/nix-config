{ config, ... }: {
  programs.ssh = { enable = true; };

  home.persistence = {
    "/persist/home/${config.home.username}".directories = [ ".ssh" ];
  };
}
