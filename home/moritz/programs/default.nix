{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./catppuccin.nix
    ./firefox.nix
    ./foot.nix
    ./git.nix
    ./gtk.nix
    ./imv.nix
    ./khal.nix
    ./khard.nix
    ./ncmpcpp.nix
    ./neomutt.nix
    ./neovim.nix
    ./pass.nix
    ./picard.nix
    ./qt.nix
    ./rofi.nix
    ./sops.nix
    ./ssh.nix
    ./swaylock.nix
    ./tmux.nix
    ./waybar.nix
    ./xdg.nix
    ./zathura.nix
    ./zsh.nix
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
    backup

    # language servers
    clang-tools
    lua-language-server
    stylua
    tree-sitter
  ];
}
