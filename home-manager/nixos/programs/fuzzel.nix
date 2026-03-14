{ config, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = false;
        prompt = "'❯ '";
        lines = 10;
        inner-pad = 15;
        vertical-pad = 15;
        layer = "overlay";
      };
      border = {
        radius = 15;
      };
    };
  };
}
