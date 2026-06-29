{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "frappe";
    accent = "blue";
    firefox.force = true;
    hyprlock.useDefaultConfig = false;
  };
}
