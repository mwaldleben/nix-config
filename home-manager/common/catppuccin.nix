{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "frappe";
    accent = "blue";
    waybar.mode = "createLink";
  };
}
