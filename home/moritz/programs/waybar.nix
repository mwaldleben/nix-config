{ config, pkgs, ... }:
let
  inherit (config.colorscheme) colors;
  pamixer = "${pkgs.pamixer}/bin/pamixer";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      primary = {
        layer = "top";
        height = 0;
        margin = "0";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right =
          [ "battery" "backlight" "pulseaudio" "pulseaudio#microphone" "tray" ];
        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [ "󰃞" "󰃟" "󰃠" ];
          on-scroll-up = "${brightnessctl} set 1%+";
          on-scroll-down = "${brightnessctl} set 1%-";
        };
        battery = {
          bat = "BAT0";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };
        clock = {
          interval = 1;
          format = "{: %R   %d/%m}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " 0%";
          format-icons = {
            headphone = "󰋋";
            headset = "󰋎";
            default = [ "" "" "" ];
          };
          on-click = "${pamixer} -t";
          on-scroll-up = "${pamixer} -i 5";
          on-scroll-down = "${pamixer} -d 5";
        };
        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 0%";
          on-click = "${pamixer} --default-source -t";
          on-scroll-up = "${pamixer} --default-source -i 5";
          on-scroll-down = "${pamixer} --default-source -d 5";
        };
        tray = {
          icon-size = 12;
          spacing = 10;
        };
      };
    };
    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: monospace;
          font-weight: normal;
          font-size: 14px;
          min-height: 0;
      }


      window#waybar {
          color: #${colors.base05};
          background: rgba(0, 0, 0, 0);
      }

      #workspaces button {
          color: #${colors.base03};
      }

      #workspaces button.active {
          color: #${colors.base05};
      }

      #workspaces button:hover {
          color: #${colors.base05};
          background: #${colors.base00};
          border-radius: 8px;
      }

      #battery,
      #backlight,
      #clock,
      #pulseaudio,
      #tray,
      #workspaces {
          background: #${colors.base00};
          padding: 0px 10px;
          margin: 3px 0px;
          margin-top: 10px;
      }

      #workspaces {
          border-radius: 5px;
          margin-left: 20px;
          padding-left: 5px;
          padding-right: 5px;
      }

      #clock {
          color: #${colors.base0D};
          border-radius: 8px;
      }

      #battery {
          color: #${colors.base0B};
          border-radius: 8px 0px 0px 8px;
          border-right: 0px;
      }

      #battery.warning {
          color: #${colors.base00};
          background: #${colors.base09};
      }

      #battery.critical {
          color: #${colors.base00};
          background: #${colors.base08};
      }

      #backlight {
          color: #${colors.base0A};
      }

      #pulseaudio {
          color: #${colors.base0C};
          border-left: 0px;
          border-right: 0px;
      }

      #pulseaudio.microphone {
          color: #${colors.base0E};
          border-left: 0px;
          border-right: 0px;
      }

      #tray {
          border-radius: 0px 8px 8px 0px;
          border-right: 0px;
          margin-right: 20px;
      }
    '';
  };
}
