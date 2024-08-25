{ inputs, pkgs, ... }:

{
  imports = [
    ./accounts
    ./cli
    ./darwin
  ];

  wallpaper = ./wallpapers/default.jpg;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # cli and utils
    (nerdfonts.override { fonts = [ "Hack" ]; })
    nodejs

    # language servers
    clang-tools
    lua-language-server
    stylua
    tree-sitter
  ];
}
