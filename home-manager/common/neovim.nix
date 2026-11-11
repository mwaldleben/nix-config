{ pkgs, ... }:
{
  # neovim config is handled in a separate repo:
  # github.com/mwaldleben/nvim
  home.packages = [ pkgs.neovim ];
}
