{ config, ... }:
let
  inherit (config.colorscheme) palette;
  tmux = "${config.programs.tmux.package}/bin/tmux";
in
{
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
      shell = {
        program = "${tmux}";
      };
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
          background = "#${palette.base00}";
          foreground = "#${palette.base05}";
          dim_foreground = "#${palette.base05}";
          bright_foreground = "#${palette.base05}";
        };
        cursor = {
          text = "#${palette.base00}";
          cursor = "#${palette.base06}";
        };
        vi_mode_cursor = {
          text = "#${palette.base00}";
          cursor = "#${palette.base07}";
        };
        search = {
          matches = {
            foreground = "#${palette.base00}";
            background = "#${palette.base05}";
          };
          focused_match = {
            foreground = "#${palette.base00}";
            background = "#${palette.base0B}";
          };
        };
        hints = {
          start = {
            foreground = "#${palette.base00}";
            background = "#${palette.base0A}";
          };
          end = {
            foreground = "#${palette.base00}";
            background = "#${palette.base05}";
          };
        };
        selection = {
          text = "#${palette.base00}";
          background = "#${palette.base06}";
        };
        normal = {
          black = "#${palette.base03}";
          red = "#${palette.base08}";
          green = "#${palette.base0B}";
          yellow = "#${palette.base0A}";
          blue = "#${palette.base0D}";
          magenta = "#${palette.base0F}";
          cyan = "#${palette.base0C}";
          white = "#${palette.base05}";
        };
        bright = {
          black = "#${palette.base04}";
          red = "#${palette.base08}";
          green = "#${palette.base0B}";
          yellow = "#${palette.base0A}";
          blue = "#${palette.base0D}";
          magenta = "#${palette.base0F}";
          cyan = "#${palette.base0C}";
          white = "#${palette.base00}";
        };
        dim = {
          black = "#${palette.base03}";
          red = "#${palette.base08}";
          green = "#${palette.base0B}";
          yellow = "#${palette.base0A}";
          blue = "#${palette.base0D}";
          magenta = "#${palette.base0F}";
          cyan = "#${palette.base0C}";
          white = "#${palette.base05}";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#${palette.base09}";
          }
          {
            index = 17;
            color = "#${palette.base06}";
          }
        ];
      };
    };
  };
}
