{ inputs, pkgs, config, ... }: {
  imports = [ ./keybindings.nix ./hyprpaper.nix ./font.nix ];

  home.packages = with pkgs; [
    hyprpaper
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      exec-once = [ "${pkgs.hyprpaper}/bin/hyprpaper" ];
      general = {
        gaps_in = 10;
        gaps_out = 20;
        border_size = 0;
        layout = "dwindle";
        cursor_inactive_timeout = 5;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_autoreload = true;
      };
      input = {
        kb_layout = "us,ch";
        kb_options = "caps:escape,grp:switch,grp:ctrls_toggle";
      };
      decoration = {
        rounding = 5;
        blur = { enabled = false; };
        drop_shadow = false;
      };
      animations = {
        enabled = true;
        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
        animation = [
          "windows, 1, 4, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 0, 6, default"
        ];
        # default setup for monitors (kanshi handles auto setup)
        monitor = map (m:
          let
            resolution = "${toString m.width}x${toString m.height}@${
                toString m.refreshRate
              }";
            position = "${toString m.x}x${toString m.y}";
          in "${m.name},${resolution},${position},1") (config.monitors);
        workspace = map (m: "${m.name},${m.workspace}") (config.monitors);
      };
    };
  };
}
