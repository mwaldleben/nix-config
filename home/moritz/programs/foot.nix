{ config, ... }:
let
  inherit (config.colorscheme) palette;
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

        foreground = "${palette.base05}";
        background = "${palette.base00}";

        regular0 = "${palette.base03}";
        regular1 = "${palette.base08}";
        regular2 = "${palette.base0B}";
        regular3 = "${palette.base0A}";
        regular4 = "${palette.base0D}";
        regular5 = "${palette.base0F}";
        regular6 = "${palette.base0C}";
        regular7 = "${palette.base05}";

        bright0 = "${palette.base04}";
        bright1 = "${palette.base08}";
        bright2 = "${palette.base0B}";
        bright3 = "${palette.base0A}";
        bright4 = "${palette.base0D}";
        bright5 = "${palette.base0F}";
        bright6 = "${palette.base0C}";
        bright7 = "${palette.base00}";

        selection-foreground = "${palette.base00}";
        selection-background = "${palette.base06}";

        search-box-no-match = "${palette.base01} ${palette.base08}";
        search-box-match = "${palette.base05} ${palette.base02}";

        jump-labels = "${palette.base01} ${palette.base09}";
        urls = "${palette.base0D}";
      };
    };
  };
}
