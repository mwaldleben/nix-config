{ config, pkgs, ... }:
{
  # neovim config is handled in a seperate repo:
  # github.com/morwald:nvim-config.git
  home.packages = [ pkgs.neovim ];
}
