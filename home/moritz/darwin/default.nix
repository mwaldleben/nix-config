{
  inputs,
  outputs,
  config,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = "moritzwaldleben";
    homeDirectory = "/Users/${config.home.username}";
    stateVersion = "23.11";
  };
}
