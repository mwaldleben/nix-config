{ config, ... }:
{
  services.mako = {
    enable = true;
    borderRadius = 8;
    borderSize = 2;
    maxIconSize = 32;
    defaultTimeout = 5000;
    extraConfig = ''
      default-timeout=0
    '';
  };
}
