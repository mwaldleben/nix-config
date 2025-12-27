{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = "moritzwaldleben";
    homeDirectory = "/Users/${config.home.username}";
    stateVersion = "25.11";
  };
}
