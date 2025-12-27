{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../common/homebrew.nix
    ../common/nix.nix
    ../common/system.nix
    ../common/users/moritz
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.moritzwaldleben = import ../../../home/moritz/macbook.nix;
  };

  environment.systemPackages = with pkgs; [
    git
    gnupg
    neovim
    ripgrep
    srm
    trash-cli
    unzip
    wget
    zip
  ];

  services.nix-daemon.enable = true;

  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
