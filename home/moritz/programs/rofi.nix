{ pkgs, config, ... }:
let inherit (config.colorscheme) colors;
in {
  home.packages = [ pkgs.rofi-power-menu ];
  programs.rofi = {
    enable = true;
    pass.enable = true;
    location = "center";
    plugins = [ pkgs.rofi-calc ];
    extraConfig = {
      modi = "drun,calc";
      icon-theme = "Papirus Dark";
      show-icons = true;
      terminal = "alacritty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
    };
    # addapted from https://github.com/adi1090x/rofi
    # style: launcher type-2, style-1
    theme = let inherit (config.lib.formats.rasi) mkLiteral;
    in {
      configuration = {
        display-drun = "Apps";
        display-calc = "Calc";
      };
      "*" = {
        background = mkLiteral "#${colors.base00}";
        background-alt = mkLiteral "#${colors.base02}";
        foreground = mkLiteral "#${colors.base05}";
        selected = mkLiteral "#${colors.base0D}";
        active = mkLiteral "#${colors.base0D}";
        urgent = mkLiteral "#${colors.base08}";
      };
      window = {
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = false;
        width = mkLiteral "500px";
        x-offset = mkLiteral "0px";
        y-offset = mkLiteral "0px";
        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "2px solid";
        border-radius = mkLiteral "8px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "@background";
        cursor = mkLiteral "default";
      };
      mainbox = {
        enabled = true;
        spacing = mkLiteral "0px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px 0px 0px 0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "transparent";
        children = map mkLiteral [ "inputbar" "listview" ];
      };
      inputbar = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "15px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
        children = map mkLiteral [ "prompt" "entry" ];
      };
      prompt = {
        enabled = true;
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
      textbox-prompt-colon = {
        enabled = true;
        expand = false;
        str = "::";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
      entry = {
        enabled = true;
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "text";
      };
      listview = {
        enabled = true;
        columns = 1;
        lines = 6;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        spacing = mkLiteral "5px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "default";
      };
      element = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "8px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "pointer";
      };
      "element normal.normal" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };
      "element selected.normal" = {
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
      };
      element-icon = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "32px";
        cursor = mkLiteral "inherit";
      };
      element-text = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        highlight = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };
      error-message = {
        padding = mkLiteral "15px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "8px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };
      textbox = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
        highlight = mkLiteral "none";
      };
    };
  };
}
