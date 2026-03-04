{ config, ... }:
let
  tmux = "${config.programs.tmux.package}/bin/tmux";
in
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      command = tmux;
      font-family = "monospace";
      font-size = 13;
      window-padding-x = 10;
      window-padding-y = 10;
      background-opacity = 0.97;
    };
  };
}
