{ config, ... }:
let
  inherit (config.colorscheme) palette;
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
    extraConfig = ''
      # addapted from https://github.com/catppuccin/zathura
      set default-fg                "#${palette.base05}"
      set default-bg 			          "#${palette.base00}"
      set completion-bg		          "#${palette.base01}"
      set completion-fg		          "#${palette.base05}"
      set completion-highlight-bg	  "#${palette.base00}"
      set completion-highlight-fg	  "#${palette.base05}"
      set completion-group-bg		    "#${palette.base02}"
      set completion-group-fg		    "#${palette.base0D}"

      set statusbar-fg		          "#${palette.base05}"
      set statusbar-bg		          "#${palette.base02}"

      set notification-bg		        "#${palette.base02}"
      set notification-fg		        "#${palette.base05}"
      set notification-error-bg	    "#${palette.base02}"
      set notification-error-fg	    "#${palette.base08}"
      set notification-warning-bg	  "#${palette.base05}"
      set notification-warning-fg	  "#${palette.base0A}"

      set inputbar-fg			          "#${palette.base00}"
      set inputbar-bg 		          "#${palette.base05}"

      set recolor-lightcolor		    "#${palette.base00}"
      set recolor-darkcolor		      "#${palette.base05}"

      set index-fg			            "#${palette.base05}"
      set index-bg			            "#${palette.base00}"
      set index-active-fg		        "#${palette.base05}"
      set index-active-bg		        "#${palette.base02}"

      set render-loading-bg		      "#${palette.base00}"
      set render-loading-fg		      "#${palette.base05}"

      set highlight-color		        "#${palette.base03}"
      set highlight-fg              "#${palette.base0E}"
      set highlight-active-color	  "#${palette.base0E}"
    '';
  };
}
