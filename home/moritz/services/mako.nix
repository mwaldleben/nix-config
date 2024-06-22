{ config, ... }:
let
  inherit (config.colorscheme) palette;
in
{
  services.mako = {
    enable = true;
    borderRadius = 8;
    maxIconSize = 32;
    # addapted from https://github.com/catppuccin/mako
    extraConfig = ''
      default-timeout=5000
      background-color=#${palette.base00}
      text-color=#${palette.base05}
      border-color=#${palette.base0D}
      progress-color=over #${palette.base02}

      border-radius=8
      border-size=2

      [urgency=high]
      border-color=#${palette.base08}
    '';
  };
}
