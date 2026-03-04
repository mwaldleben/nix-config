{ inputs, pkgs, ... }:
{
  imports = [
    ./common/font.nix
    ./common/ghostty.nix
    ./common/git.nix
    ./common/neovim.nix
    ./common/tmux.nix
    ./common/todo-txt.nix
    ./common/zsh.nix
    ./darwin/default.nix
    ./darwin/programs
  ];
}
