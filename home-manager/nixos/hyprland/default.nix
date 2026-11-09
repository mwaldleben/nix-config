{ config, lib, ... }:
let
  toLua = lib.generators.toLua { };
in
{
  imports = [
    ./keybindings.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd(${toLua "${config.wayland.windowManager.hyprland.package}/bin/hyprctl setcursor catppuccin-frappe-blue-cursors 32"})
            end'')
        ];
      };
      config = {
        xwayland = {
          force_zero_scaling = true;
        };
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
        };
      };
      # monitor setup (kanshi handles switching profiles)
      monitor = [
        {
          output = "eDP-1";
          mode = "2880x1800@60";
          position = "auto";
          scale = 1.5;
        }
        {
          output = "HDMI-A-1";
          mode = "3840x2160@60";
          position = "auto";
          scale = 1.5;
        }
        # catch-all for unknown monitors
        {
          output = "";
          mode = "preferred";
          position = "auto";
          scale = 1;
        }
      ];
    };
  };
}
