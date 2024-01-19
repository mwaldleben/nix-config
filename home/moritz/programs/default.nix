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
    picard
    teams-for-linux
    google-chrome

    # cli and utils
    brightnessctl
    cargo
    libnotify
    mpv
    nodejs
    openjdk
    sops
    texlive.combined.scheme-full
    urlscan
    youtube-dl
    wl-clipboard

    # personal scripts (pkgs directory)
    backup

    # language servers
    lua-language-server
    stylua
  ];
}
