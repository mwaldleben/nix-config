{ config, ... }:
let inherit (config.colorscheme) colors;
in {
  services.mako = {
    enable = true;
    borderRadius = 8;
    maxIconSize = 32;
    # addapted from https://github.com/catppuccin/mako
    extraConfig = ''
      default-timeout=5000
      background-color=#${colors.base00}
      text-color=#${colors.base05}
      border-color=#${colors.base0D}
      progress-color=over #${colors.base02}

      border-radius=8
      border-size=2

      [urgency=high]
      border-color=#${colors.base08}
    '';
  };
}
