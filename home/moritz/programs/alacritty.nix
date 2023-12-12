{ config, ... }:
let
  inherit (config.colorscheme) colors;
  tmux = "${config.programs.tmux.package}/bin/tmux";
in {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.97;
        padding = {
          x = 10;
          y = 10;
        };
      };
      shell = { program = "${tmux}"; };
      font = {
        normal = {
          family = "monospace";
          style = "Regular";
        };
        bold = {
          family = "monospace";
          style = "Bold";
        };
        italic = {
          family = "monospace";
          style = "Italic";
        };
        size = 13;
      };
      env.TERM = "xterm-256color";
      # addapted from https://github.com/catppuccin/alacritty
      colors = {
        primary = {
          background = "#${colors.base00}";
          foreground = "#${colors.base05}";
          dim_foreground = "#${colors.base05}";
          bright_foreground = "#${colors.base05}";
        };
        cursor = {
          text = "#${colors.base00}";
          cursor = "#${colors.base06}";
        };
        vi_mode_cursor = {
          text = "#${colors.base00}";
          cursor = "#${colors.base07}";
        };
        search = {
          matches = {
            foreground = "#${colors.base00}";
            background = "#${colors.base05}";
          };
          focused_match = {
            foreground = "#${colors.base00}";
            background = "#${colors.base0B}";
          };
          footer_bar = {
            foreground = "#${colors.base00}";
            background = "#${colors.base05}";
          };
        };
        hints = {
          start = {
            foreground = "#${colors.base00}";
            background = "#${colors.base0A}";
          };
          end = {
            foreground = "#${colors.base00}";
            background = "#${colors.base05}";
          };
        };
        selection = {
          text = "#${colors.base00}";
          background = "#${colors.base06}";
        };
        normal = {
          black = "#${colors.base03}";
          red = "#${colors.base08}";
          green = "#${colors.base0B}";
          yellow = "#${colors.base0A}";
          blue = "#${colors.base0D}";
          magenta = "#${colors.base0F}";
          cyan = "#${colors.base0C}";
          white = "#${colors.base05}";
        };
        bright = {
          black = "#${colors.base04}";
          red = "#${colors.base08}";
          green = "#${colors.base0B}";
          yellow = "#${colors.base0A}";
          blue = "#${colors.base0D}";
          magenta = "#${colors.base0F}";
          cyan = "#${colors.base0C}";
          white = "#${colors.base00}";
        };
        dim = {
          black = "#${colors.base03}";
          red = "#${colors.base08}";
          green = "#${colors.base0B}";
          yellow = "#${colors.base0A}";
          blue = "#${colors.base0D}";
          magenta = "#${colors.base0F}";
          cyan = "#${colors.base0C}";
          white = "#${colors.base05}";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#${colors.base09}";
          }
          {
            index = 17;
            color = "#${colors.base06}";
          }
        ];
      };
    };
  };
}
