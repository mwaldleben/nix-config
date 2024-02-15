{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./firefox.nix
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
    ./ssh.nix
    ./swaylock.nix
    ./tmux.nix
    ./waybar.nix
    ./xdg.nix
    ./zathura.nix
    ./zsh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # packages without setup
  home.packages = with pkgs; [
    # gui
    darktable
    inkscape

    # cli and utils
    brightnessctl
    cargo
    exiftool
    libnotify
    mpv
    nodejs
    openjdk
    sops
    texlive.combined.scheme-full
    urlscan
    yt-dlp
    wl-clipboard

    # personal scripts (pkgs directory)
    backup

    # language servers
    lua-language-server
    stylua
  ];
}
