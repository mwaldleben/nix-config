{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../common/homebrew.nix
    ../common/nix.nix
    ../common/system.nix
    ../common/users/moritz
  ];

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
