{ inputs, ... }:
{
  imports = [
    ./accounts
    ./essentials
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
