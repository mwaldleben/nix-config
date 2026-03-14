{ config, ... }:
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
    ./common/calendar.nix
    ./common/contacts.nix
    ./common/mail.nix
    ./nixos
  ];

  programs = {
    home-manager.enable = true;
  };

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
