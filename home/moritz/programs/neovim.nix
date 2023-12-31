{ config, pkgs, ... }: {
  # neovim config is handled in a seperate repo:
  # github.com/morwald:nvim.git
  home.packages = [ pkgs.neovim ];
  home.persistence = {
    "/persist/home/${config.home.username}".directories = [ ".config/nvim" ];
  };
}
