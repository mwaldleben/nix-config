{ config, ... }:
{
  services.mako = {
    enable = true;
    borderRadius = 8;
    maxIconSize = 32;
    extraConfig = ''
      default-timeout=5000

      border-radius=8
      border-size=2
    '';
  };
}
