{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ../common/nix.nix
    ../common/system.nix
  ];

  users.users.moritzwaldleben = {
    home = "/Users/moritzwaldleben";
  };

  environment.systemPackages = with pkgs; [
    entr
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

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  system.primaryUser = "moritzwaldleben";

  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
