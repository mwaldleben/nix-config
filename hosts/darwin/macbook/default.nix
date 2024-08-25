{
  inputs,
  outputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../common/gpg-agent.nix
    ../common/homebrew.nix
    ../common/nix.nix
    ../common/system.nix
    ../common/users/moritz
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    users.moritz = import ../../home/moritz/macbook.nix;
  };

  services.nix-daemon.enable = true;

  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
