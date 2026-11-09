{ lib, ... }:
let
  # catppuccin palette, loaded as a lua local by the catppuccin module
  color = name: lib.generators.mkLuaInline "colors.${name}";
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
      config = {
        xwayland = {
          force_zero_scaling = true;
        };
        general = {
          gaps_in = 4;
          gaps_out = 8;
          border_size = 2;
          col = {
            active_border = color "blue";
            inactive_border = color "surface0";
          };
        };
        dwindle = {
          preserve_split = true;
        };
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          disable_autoreload = true;
          background_color = color "base";
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
          rounding = 8;
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
