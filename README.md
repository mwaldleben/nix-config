# My NixOS configuration

This repository contains my personal NixOS configuration! The setup leverages
[Nix flakes](https://nixos.wiki/wiki/Flakes) and integrates [Home
Manager](https://github.com/nix-community/home-manager) for the user
configuration. As my daily driver, I rely on the
[Hyprland](https://github.com/hyprwm/Hyprland) window manager for Wayland.

<img src="/showcase1.png" width=75%>
<img src="/showcase2.png" width=75%>

## Features:

- Possible multi-user/multi-system setup
- Encrypted BTRFS partition
- Ephemeral root setup with opt-in persistence through
  [impermance](https://github.com/nix-community/impermanence)
- Consistent theming with
  [catppucccin](https://github.com/catppucccin/nix)
- Declarative Secrets with [sops-nix](https://github.com/Mic92/sops-nix)

## Installation

To set up a similar environment, one would need to roughly follow theses steps:

1. Create a [BTRFS](https://nixos.wiki/wiki/Btrfs) filesystem with subvolumes
   `/nix`, `/persist`, swap file and root subvolume.
2. Generate a simple NixOS configuration for your system.
3. Place the `hardware-configuration.nix` file from this setup into the
   `hosts/mycomputer` folder to configure a new host.
4. Make new secrets file with login password.
5. Customize user-specific configurations in the folder `home/moritz` and
   adjust the user name accordingly.

## Programs I Use

| Name                 | Description                                                            |
| -------------------- | ---------------------------------------------------------------------- |
| Window manager       | Hyprland                                                               |
| Status bar           | waybar                                                                 |
| Shell                | zsh                                                                    |
| Terminal emulator    | alacritty                                                              |
| Terminal multiplexer | tmux                                                                   |
| Editor               | neovim (managed in a separate [repo](https://github.com/morwald/nvim)) |
| Browser              | firefox                                                                |
| Mail                 | neomutt with mbsync                                                    |
| Calendar/contacts    | khal, khard and vdirsyncer                                             |
| Application launcher | fuzzel                                                                 |
| Password manager     | pass with GPG key stored on a YubiKey                                  |
| PDF reader           | zathura                                                                |
| Music player         | ncmpcpp                                                                |
| Colorscheme          | catpuccin frappe                                                       |

## Credits

Most of the code in this configuration was adapted from
[this](https://github.com/Misterio77/nix-config/tree/main) amazing
configuration. Check out as well the
[starter-templates](https://github.com/Misterio77/nix-starter-configs) to
getting started with Nix flakes.
