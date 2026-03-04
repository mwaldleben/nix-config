{ pkgs, ... }:
{
  # neovim config is handled in a seperate repo:
  # github.com/mwaldleben:nvim-config.git
  home.packages = [ pkgs.neovim ];
}
