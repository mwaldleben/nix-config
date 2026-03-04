{ config, ... }:
let
  tmux = "${config.programs.tmux.package}/bin/tmux";
in
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "monospace:size=13";
        dpi-aware = "no";
        pad = "10x10";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        alpha = 0.97;
      };
    };
  };
}
