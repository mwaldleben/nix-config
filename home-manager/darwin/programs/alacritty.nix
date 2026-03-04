{ config, ... }:
let
  tmux = "${config.programs.tmux.package}/bin/tmux";
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        option_as_alt = "Both";
        decorations = "Buttonless";
        opacity = 1.0;
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
          family = "Hack Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "Hack Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Hack Nerd Font";
          style = "Italic";
        };
        size = 14;
      };
      env.TERM = "xterm-256color";
    };
  };
}
