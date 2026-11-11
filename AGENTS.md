# AGENTS.md

NixOS + nix-darwin flake managing a personal ThinkPad (NixOS), a work MacBook (macOS) and a WSL machine (standalone Home Manager).

## Build Commands

```bash
nrs                         # alias: sudo nixos-rebuild --flake . switch (on darwin: nix run nix-darwin -- switch)
hs                          # alias (WSL only): home-manager switch --flake .#moritz@wsl
nix fmt                     # formatter: nixfmt-tree
nix flake check --no-build  # evaluate all configurations
nix build --no-link .#nixosConfigurations.thinkpad.config.system.build.toplevel  # test build without switching
sops hosts/nixos/thinkpad/secrets.yaml  # edit encrypted secrets
```

## Repository Structure

```
flake.nix                              # inputs, nixosConfigurations.thinkpad, darwinConfigurations."MacBook-Pro", homeConfigurations."moritz@wsl"
hosts/
  nixos/common/                        # shared NixOS system modules (audio, networking, impermanence, sops, ...)
  nixos/thinkpad/                      # host config, hardware config, secrets.yaml
  darwin/common/                       # shared darwin modules (nix settings, system defaults)
  darwin/macbook/                      # macOS host config
home-manager/
  moritz-thinkpad.nix                  # NixOS user profile entry point, also holds user persistence
  moritzwaldleben-macbook.nix          # darwin user profile entry point
  moritz-wsl.nix                       # standalone home-manager on WSL (single-user nix, no systemd)
  common/                              # cross-platform: zsh, git, ghostty, herdr, neovim, fonts, ssh, firefox
  nixos/                               # NixOS-only: hyprland, ashell, gtk, fuzzel, sops, pi, services
  wallpapers/                          # default.jpg (tracked), custom.jpg (gitignored override)
overlays/default.nix                   # additions (custom pkgs) + modifications
pkgs/                                  # custom packages (backup script), available as pkgs.<name> via overlay
```

## Key Conventions

- **One concern per file.** Each `.nix` file handles a single program, service, or system aspect.
- **Imports are listed explicitly** in the entry points (`home-manager/moritz-*.nix`, `hosts/*/*/configuration.nix`). To add a program, create the file AND add it to the relevant entry point. Only `home-manager/nixos/hyprland/` uses a `default.nix`.
- **Module args pattern:** `{ config, pkgs, ... }:` or `{ inputs, pkgs, config, ... }:`. Don't add unused args.
- **`inputs` is available everywhere** via `specialArgs` / `extraSpecialArgs` in flake.nix.
- **Reference packages via `config`**, e.g. `${config.programs.ghostty.package}/bin/ghostty`, not hardcoded store paths.
- **Use `config.home.homeDirectory`** instead of hardcoded `/home/moritz`.
- **Firefox uses XDG config path** at `${config.xdg.configHome}/mozilla/firefox`.
- **New files must be `git add`ed** before building, flakes only see tracked files.
- **Commit style:** lowercase, short, descriptive. Examples: `fix syncthing tray`, `remove docker`, `use hyprpaper home-manager module`.

## Impermanence

The ThinkPad wipes `/` on every reboot (BTRFS snapshot restore). Only `/persist` and `/nix` survive.

When adding stateful programs, you MUST add their directories to:
- **System:** `hosts/nixos/common/impermanence.nix` (`environment.persistence."/persist".directories`)
- **User:** `home-manager/moritz-thinkpad.nix` (`home.persistence."/persist".directories` / `.files`)

## Secrets

SOPS + age via `sops-nix`. All secrets in `hosts/nixos/thinkpad/secrets.yaml`. Age key derived from SSH host key at `/persist/etc/ssh/ssh_host_ed25519_key`.

- System secrets (user passwords): `hosts/nixos/thinkpad/configuration.nix`
- Home-manager sops setup: `home-manager/nixos/sops.nix` (no secrets defined there currently)
- `users.mutableUsers = false` -- passwords can only be changed via sops.

## Theming

Catppuccin (frappe/blue) applied globally via `catppuccin/nix` flake input, imported in all three home-manager profiles. Programs the module doesn't cover (ashell, mako, gtk, hyprland borders) read `config.catppuccin.flavor` / `config.catppuccin.accent`, so changing the accent in `home-manager/common/catppuccin.nix` is enough.

The wallpaper is `home-manager/wallpapers/default.jpg`. If the gitignored `custom.jpg` exists next to it, it is used instead (resolved at activation, linked to `~/.local/share/wallpaper.jpg`).

## Platform Notes

- **NixOS user:** `moritz`. **Darwin user:** `moritzwaldleben`.
- **Darwin hostname** in flake is `"MacBook-Pro"` (with hyphens).
- **Home Manager stateVersion:** `26.05`.
- **NixOS system.stateVersion:** `26.05`. **nix-darwin system.stateVersion:** `4`.
- Neovim config is in a separate repo; only the package is installed here.
- `pi` runs sandboxed with jail.nix (`home-manager/nixos/pi.nix`), only the current git repo is writable.
- No CI/CD. Changes applied manually.
