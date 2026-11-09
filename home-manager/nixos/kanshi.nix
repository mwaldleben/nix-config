{ pkgs, ... }:
{
  home.packages = [ pkgs.kanshi ];
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.5;
            status = "enable";
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "*";
            status = "enable";
          }
        ];
      }
      {
        profile.name = "both";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.5;
            position = "0,0";
            status = "enable";
          }
          {
            criteria = "*";
            position = "1920,0";
            status = "enable";
          }
        ];
      }
    ];
  };
}
