{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    inputs.catppuccin.homeModules.catppuccin
  ] ++ (builtins.attrValues inputs.self.homeManagerModules);

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = "moritz";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.11";
    persistence = {
      "/persist/home/${config.home.username}" = {
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
