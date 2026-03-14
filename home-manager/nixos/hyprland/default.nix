{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./keybindings.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];

  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      xwayland = {
        force_zero_scaling = true;
      };
      exec-once = [
        "${config.wayland.windowManager.hyprland.package}/bin/hyprctl setcursor catppuccin-frappe-blue-cursors 32"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
        layout = "dwindle";
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_autoreload = true;
      };
      input = {
        kb_layout = "us,ch";
        kb_options = "caps:escape,grp:switch,grp:ctrls_toggle";
        touchpad = {
          disable_while_typing = true;
        };
      };
      cursor = {
        inactive_timeout = 5;
      };
      decoration = {
        rounding = 15;
        blur = {
          enabled = false;
        };
        shadow = {
          enabled = false;
        };
      };
      animations = {
        enabled = false;
        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
        animation = [
          "windows, 1, 4, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 0, 10, default"
          "borderangle, 0, 8, default"
          "fade, 1, 7, default"
          "workspaces, 0, 6, default"
        ];
      };
      # monitor setup (kanshi handles switching profiles)
      monitor = [
        "eDP-1, 2880x1800@60, auto, 1.5"
        "HDMI-A-1, 3840x2160@60, auto, 1.5"
        ", preferred, auto, 1" # catch-all for unknown monitors
      ];
    };
  };
}
