{
  inputs,
  outputs,
  config,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = "moritzwaldleben";
    homeDirectory = "/Users/${config.home.username}";
    stateVersion = "25.11";
  };
}
