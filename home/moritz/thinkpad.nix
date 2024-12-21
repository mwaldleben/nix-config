{ inputs, ... }:
{
  imports = [
    ./accounts
    ./cli
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
      refreshRate = 90;
      workspace = "1";
    }
    {
      name = "HDMI-A-1";
      width = 2560;
      height = 1440;
      refreshRate = 60;
      workspace = "2";
    }
  ];
}
