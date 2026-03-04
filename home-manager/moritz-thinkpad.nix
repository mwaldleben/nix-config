{ inputs, ... }:
{
  imports = [
    ./common/git.nix
    ./common/neovim.nix
    ./common/tmux.nix
    ./common/todo-txt.nix
    ./common/zsh.nix
    ./common/calendar.nix
    ./common/contacts.nix
    ./common/mail.nix
    ./nixos/default.nix
    ./nixos/hyprland
    ./nixos/services
    ./nixos/programs
  ];

  wallpaper = ./wallpapers/default.jpg;

  monitors = [
    {
      name = "eDP-1";
      width = 2880;
      height = 1800;
      refreshRate = 60;
      scale = 1.5;
      workspace = "1";
    }
    {
      name = "HDMI-A-1";
      width = 3840;
      height = 2160;
      refreshRate = 60;
      scale = 1.5;
      workspace = "2";
    }
  ];
}
