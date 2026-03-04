{ config, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = true;
  };
}
