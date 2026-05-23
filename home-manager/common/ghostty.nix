{ config, pkgs, ... }:
let
  zellij = "${config.programs.zellij.package}/bin/zellij";
in
{
  programs.ghostty = {
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    enable = true;
    enableZshIntegration = true;
    settings = {
      command = zellij;
      confirm-close-surface = false;
      font-family = "monospace";
      font-size = if pkgs.stdenv.isDarwin then 15 else 13;
      keybind = [
        "clear"
        "ctrl+shift+c=copy_to_clipboard"
        "super+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        "super+v=paste_from_clipboard"
      ];
      macos-titlebar-style = "hidden";
      maximize = true;
      resize-overlay = "never";
      window-padding-x = 10;
      window-padding-y = 10;
      background-opacity = if pkgs.stdenv.isDarwin then 1 else 0.97;
    };
  };
}
