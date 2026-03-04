{ config, ... }:
let
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
    };
  };
}
