# My NixOS configuration

This repository contains my personal NixOS configuration! The setup leverages
[Nix flakes](https://nixos.wiki/wiki/Flakes) and integrates [Home
Manager](https://github.com/nix-community/home-manager) for the user
configuration. As my daily driver, I rely on the
[Hyprland](https://github.com/hyprwm/Hyprland) window manager for Wayland.

<img src="/showcase1.png" width=75%>
<img src="/showcase2.png" width=75%>

## Features

- Multi-host setup: ThinkPad (NixOS) and MacBook (nix-darwin)
- Cross-platform common config shared between both machines
- Encrypted BTRFS partition
- Ephemeral root setup with opt-in persistence through
  [impermanence](https://github.com/nix-community/impermanence)
- Consistent theming with [catppuccin](https://github.com/catppuccin/nix) (frappe, blue accent)
- Declarative secrets with [sops-nix](https://github.com/Mic92/sops-nix)

## Programs

| Category             | Program                                                                   |
| -------------------- | ------------------------------------------------------------------------- |
| Window manager       | Hyprland                                                                  |
| Status bar           | ashell                                                                    |
| Shell                | zsh                                                                       |
| Terminal emulator    | Ghostty                                                                   |
| Terminal multiplexer | tmux                                                                      |
| Editor               | neovim (managed in a separate [repo](https://github.com/mwaldleben/nvim)) |
| Browser              | Firefox                                                                   |
| Application launcher | fuzzel                                                                    |
| Password manager     | pass with GPG key stored on a YubiKey                                     |
| Notifications        | mako                                                                      |
| PDF reader           | zathura                                                                   |
| Image viewer         | imv                                                                       |
| Music player         | Lollypop                                                                  |
| Screenshots          | hyprshot                                                                  |
| AI coding assistant  | pi (NixOS)                                                                |
| Colorscheme          | catppuccin frappe                                                         |

## Installation

The installation script `install.sh` helps to generate a BTRFS filesystem with
the default NixOS config. Below the steps one would roughly need to follow to
set up the system:

1. Create a [BTRFS](https://nixos.wiki/wiki/Btrfs) filesystem with subvolumes
   `/nix`, `/persist`, swap file and root subvolume.
2. Generate and build default NixOS configuration for your system.
3. Clone this repository.
4. Place the `hardware-configuration.nix` file from this setup into the
   `hosts/mycomputer` folder to configure a new host.
5. Make new secrets file with login passwords.
6. Customize user-specific configurations in the folder `home/moritz` and
   adjust the user name accordingly.
7. Make the folder `/persist/home/myname` owned by your user for home-manager
   to work with impermanence.

## Credits

Most of the code in this configuration was adapted from
[this](https://github.com/Misterio77/nix-config/tree/main) amazing
configuration. Check out as well the
[starter-templates](https://github.com/Misterio77/nix-starter-configs) to
getting started with Nix flakes.
