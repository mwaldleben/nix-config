{ config, ... }:
let inherit (config.colorscheme) colors;
in {
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
      set default-fg                "#${colors.base05}"
      set default-bg 			          "#${colors.base00}"
      set completion-bg		          "#${colors.base01}"
      set completion-fg		          "#${colors.base05}"
      set completion-highlight-bg	  "#${colors.base00}"
      set completion-highlight-fg	  "#${colors.base05}"
      set completion-group-bg		    "#${colors.base02}"
      set completion-group-fg		    "#${colors.base0D}"

      set statusbar-fg		          "#${colors.base05}"
      set statusbar-bg		          "#${colors.base02}"

      set notification-bg		        "#${colors.base02}"
      set notification-fg		        "#${colors.base05}"
      set notification-error-bg	    "#${colors.base02}"
      set notification-error-fg	    "#${colors.base08}"
      set notification-warning-bg	  "#${colors.base05}"
      set notification-warning-fg	  "#${colors.base0A}"

      set inputbar-fg			          "#${colors.base00}"
      set inputbar-bg 		          "#${colors.base05}"

      set recolor-lightcolor		    "#${colors.base00}"
      set recolor-darkcolor		      "#${colors.base05}"

      set index-fg			            "#${colors.base05}"
      set index-bg			            "#${colors.base00}"
      set index-active-fg		        "#${colors.base05}"
      set index-active-bg		        "#${colors.base02}"

      set render-loading-bg		      "#${colors.base00}"
      set render-loading-fg		      "#${colors.base05}"

      set highlight-color		        "#${colors.base03}"
      set highlight-fg              "#${colors.base0E}"
      set highlight-active-color	  "#${colors.base0E}"
    '';
  };
}
