{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "frappe";
    accent = "blue";
    firefox.force = true;
    hyprlock.useDefaultConfig = false;
  };
}
