{ config, pkgs, ... }:
let
  inherit (config.colorscheme) palette;
  pamixer = "${pkgs.pamixer}/bin/pamixer";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
in
{
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
        modules-right = [
          "battery"
          "backlight"
          "pulseaudio"
          "pulseaudio#microphone"
          "tray"
        ];
        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
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
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        clock = {
          interval = 1;
          format = " {:%R   %d/%m}";
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
            default = [
              ""
              ""
              ""
            ];
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
          color: #${palette.base05};
          background: rgba(0, 0, 0, 0);
      }

      #workspaces button {
          color: #${palette.base03};
      }

      #workspaces button.active {
          color: #${palette.base05};
      }

      #workspaces button:hover {
          color: #${palette.base05};
          background: #${palette.base00};
          border-radius: 8px;
      }

      #battery,
      #backlight,
      #clock,
      #pulseaudio,
      #tray,
      #workspaces {
          background: #${palette.base00};
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
          color: #${palette.base0D};
          border-radius: 8px;
      }

      #battery {
          color: #${palette.base0B};
          border-radius: 8px 0px 0px 8px;
          border-right: 0px;
      }

      #battery.warning {
          color: #${palette.base00};
          background: #${palette.base09};
      }

      #battery.critical {
          color: #${palette.base00};
          background: #${palette.base08};
      }

      #backlight {
          color: #${palette.base0A};
      }

      #pulseaudio {
          color: #${palette.base0C};
          border-left: 0px;
          border-right: 0px;
      }

      #pulseaudio.microphone {
          color: #${palette.base0E};
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
