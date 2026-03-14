{ pkgs, ... }:
{
  imports = [
    ./catppuccin.nix
    ./firefox.nix
    ./fuzzel.nix
    ./foot.nix
    ./gtk.nix
    ./htop.nix
    ./imv.nix
    ./khal.nix
    ./khard.nix
    ./ncmpcpp.nix
    ./neomutt.nix
    ./opencode.nix
    ./pass.nix
    ./picard.nix
    ./qt.nix
    ./sops.nix
    ./ssh.nix
    ./xdg.nix
    ./zathura.nix
  ];

  # packages without setup
  home.packages = with pkgs; [
    # gui
    darktable
    lollypop
    libreoffice

    # cli and utils
    brightnessctl
    cargo
    exiftool
    ghostscript
    libnotify
    android-file-transfer
    mpv
    nodejs
    openjdk
    pandoc
    signal-desktop
    urlscan
    yt-dlp
    wl-clipboard
    # texlive.combined.scheme-full

    # personal scripts (pkgs directory)
    backup

    # language servers
    clang-tools
    lua-language-server
    stylua
    tree-sitter
  ];
}
