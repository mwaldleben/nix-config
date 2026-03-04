{ inputs, ... }:
{
  imports = [
    ./common/font.nix
    ./common/git.nix
    ./common/neovim.nix
    ./common/tmux.nix
    ./common/todo-txt.nix
    ./common/zsh.nix
    ./common/calendar.nix
    ./common/contacts.nix
    ./common/mail.nix
    ./nixos/default.nix
    ./nixos/hyprland
    ./nixos/services
    ./nixos/programs
  ];
}
