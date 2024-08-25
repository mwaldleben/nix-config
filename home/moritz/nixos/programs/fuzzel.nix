{ config, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = false;
        font = "${config.fontProfiles.monospace.family}:size=13";
        terminal = "${config.programs.foot.package}/bin/foot";
        prompt = "'❯ '";
        lines = 10;
        inner-pad = 15;
        vertical-pad = 15;
        layer = "overlay";
      };
      border = {
        radius = 8;
      };
      # TODO: catppuccin nix doesnt support fuzzel yet 
      colors = {
        text = "c6d0f5ff";
        selection-text = "c6d0f5ff";
        match = "8caaeeff";
        selection-match = "8caaeeff";
        background = "303446ff";
        selection = "414559ff";
        border = "8caaeeff";
      };
    };
  };
}
