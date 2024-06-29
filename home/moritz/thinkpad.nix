{ inputs, ... }:
{
  imports = [
    ./default.nix
    ./accounts
    ./services
    ./programs
    ./hyprland
  ];

  wallpaper = ./wallpapers/default.jpg;

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      workspace = "1";
    }
    {
      name = "HDMI-A-2";
      width = 2560;
      height = 1440;
      refreshRate = 60;
      x = 1920;
      workspace = "2";
    }
  ];
}
