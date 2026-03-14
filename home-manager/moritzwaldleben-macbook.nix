{ config, ... }:
{
  imports = [
    ./common/catppuccin.nix
    ./common/claude-code.nix
    ./common/firefox.nix
    ./common/font.nix
    ./common/ghostty.nix
    ./common/git.nix
    ./common/github.nix
    ./common/neovim.nix
    ./common/tmux.nix
    ./common/todo-txt.nix
    ./common/ssh.nix
    ./common/zsh.nix
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
