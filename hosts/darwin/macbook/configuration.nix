{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ../common/homebrew.nix
    ../common/nix.nix
    ../common/system.nix
  ];

  users.users.moritzwaldleben = {
    home = "/Users/moritzwaldleben";
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

  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
