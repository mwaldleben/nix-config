{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./keybindings.nix
    ./hyprpaper.nix
    ./font.nix
  ];

  home.packages = [
    pkgs.hyprpaper
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
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${config.programs.foot.package}/bin/foot --server"
        "${config.wayland.windowManager.hyprland.package}/bin/hyprctl setcursor catppuccin-frappe-blue-cursors 32"
      ];
      general = {
        gaps_in = 10;
        gaps_out = 20;
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
        rounding = 10;
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
      # default setup for monitors (kanshi handles auto setup)
      monitor = map (
        m:
        let
          resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
          position = "auto";
          scale = "${toString m.scale}";
        in
        "${m.name}, ${resolution}, ${position}, ${scale}"
      ) (config.monitors);
      workspace = map (m: "${m.name}, ${m.workspace}") (config.monitors);
    };
  };
}
