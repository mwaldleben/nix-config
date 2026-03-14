{ config, pkgs, ... }:
{
  imports = [
    ./common/catppuccin.nix
    ./common/firefox.nix
    ./common/font.nix
    ./common/ghostty.nix
    ./common/git.nix
    ./common/neovim.nix
    ./common/tmux.nix
    ./common/todo-txt.nix
    ./common/ssh.nix
    ./common/zsh.nix
    ./nixos/hyprland
    ./nixos/ashell.nix
    ./nixos/fuzzel.nix
    ./nixos/gtk.nix
    ./nixos/imv.nix
    ./nixos/opencode.nix
    ./nixos/pass.nix
    ./nixos/qt.nix
    ./nixos/sops.nix
    ./nixos/xdg.nix
    ./nixos/zathura.nix
    ./nixos/gpg.nix
    ./nixos/kanshi.nix
    ./nixos/mako.nix
    ./nixos/mpd.nix
    ./nixos/syncthing.nix
    ./nixos/udiskie.nix
  ];

  programs = {
    home-manager.enable = true;
  };

  # packages without setup
  home.packages = with pkgs; [
    # gui
    lollypop # music player
    libreoffice # office suite
    darktable # photo editor
    picard # music tagger

    # cli tools and utils
    mpv # media player
    signal-desktop # messaging app
    yt-dlp # video downloader
    android-file-transfer # transfer files to/from android
    hyprshot # screenshot utility
    brightnessctl # screen brightness control
    pandoc # document converter
    ghostscript # postscript and pdf interpreter
    htop # interactive process viewer
    libnotify # desktop notification library
    wl-clipboard # wayland clipboard utilities
    tree-sitter # parser generator for code in editor
    nodejs # javascript runtime
    cargo # rust package manager
    openjdk # java development kit

    # personal scripts (pkgs directory)
    backup # system backup script

  ];

  home = {
    username = "moritz";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.11";
    persistence = {
      "/persist" = {
        directories = [
          "code"
          "downloads"
          "music"
          "notes"
          "pictures"
          "other"
          ".calendars"
          ".contacts"
          ".mail"
          ".local"
          ".password-store"
          ".gnupg"
          ".ssh"
          ".mozilla/firefox"
          ".config/MusicBrainz"
          ".config/nvim"
          ".config/tmux"
          ".config/todo"
          ".config/syncthing"
          ".config/Signal"
        ];
      };
    };
  };

  # session variables
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    LIBSEAT_BACKEND = "logind";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  systemd.user.startServices = "sd-switch";
}
