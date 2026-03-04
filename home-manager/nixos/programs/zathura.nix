{ config, ... }:
let
in
{
  programs.zathura = {
    enable = true;
    options = {
      font = "monospace 13";
      window-title-home-tilde = true;
      statusbar-basename = true;
      selection-clipboard = "clipboard";
    };
    mappings = {
      "<Space>" = "navigate next";
      "<C-Space>" = "navigate previous";
    };
  };
}
