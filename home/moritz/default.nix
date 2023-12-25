{ inputs, outputs, config, ... }: {
  imports = [ 
    inputs.impermanence.nixosModules.home-manager.impermanence
    inputs.nix-colors.homeManagerModule
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  programs = { home-manager.enable = true; };

  nixpkgs = { overlays = builtins.attrValues outputs.overlays; };

  home = {
    username = "moritz";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.11";
    persistence = {
      "/persist/home/${config.home.username}" = {
        directories = [
          "calendar"
          "contacts"
          "downloads"
          "mail"
          "nixos"
          "notes"
          "pictures"
          "projs"
          ".local"
          ".config/nvim"
          ".mozilla"
          ".ssh"
          ".gnupg"
	        ".password-store"
        ];
        files = [
          ".config/zsh/history"
        ];
        allowOther = true;
      };
    };
  };

  # session variables
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    LIBSEAT_BACKEND = "logind";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  # restart systemd services when running "home-manager --flake . switch"
  systemd.user.startServices = "sd-switch";
}
