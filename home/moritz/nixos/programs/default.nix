{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./catppuccin.nix
    ./firefox.nix
    ./fuzzel.nix
    ./foot.nix
    ./gtk.nix
    ./imv.nix
    ./khal.nix
    ./khard.nix
    ./picard.nix
    ./qt.nix
    ./swaylock.nix
    ./waybar.nix
    ./xdg.nix
    ./zathura.nix
  ];

  # packages without setup
  home.packages = with pkgs; [
    # gui
    darktable
    inkscape
    libreoffice-still
    chromium
    zoom-us

    # cli and utils
    brightnessctl
    cargo
    exiftool
    ghostscript
    libnotify
    mpv
    nodejs
    openjdk
    pandoc
    texlive.combined.scheme-full
    urlscan
    yt-dlp
    wl-clipboard

    # personal scripts (pkgs directory)
    # backup

    # language servers
    clang-tools
    lua-language-server
    stylua
    tree-sitter
  ];
}
