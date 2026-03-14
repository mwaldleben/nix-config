{ config, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      border-radius = 8;
      border-size = 2;
      max-icon-size = 32;
      default-timeout = 5000;
    };
  };
}
