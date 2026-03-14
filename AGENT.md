# AGENT.md

NixOS + nix-darwin flake managing a personal ThinkPad (NixOS) and a work MacBook (macOS).

## Build Commands

```bash
nrs                         # alias: sudo nixos-rebuild --flake . switch
hm                          # alias: home-manager --flake . switch
darwin-rebuild --flake .#MacBook-Pro switch
nix fmt                     # formatter: nixfmt-tree
sops hosts/nixos/thinkpad/secrets.yaml  # edit encrypted secrets
```

## Repository Structure

```
flake.nix                              # inputs, nixosConfigurations.thinkpad, darwinConfigurations."MacBook-Pro"
hosts/
  nixos/common/                        # shared NixOS system modules (audio, networking, impermanence, sops, ...)
  nixos/thinkpad/                      # host config, hardware config, secrets.yaml
  darwin/common/                       # shared darwin modules (homebrew, system defaults)
  darwin/macbook/                      # macOS host config
home-manager/
  moritz-thinkpad.nix                  # NixOS user profile entry point
  moritzwaldleben-macbook.nix          # darwin user profile entry point
  common/                              # cross-platform: zsh, git, tmux, ghostty, neovim, fonts, mail, calendar, contacts
  nixos/                               # NixOS-only: hyprland, waybar, foot, firefox, sops, services
  darwin/                              # darwin-only: ghostty overrides (package=null), catppuccin
overlays/default.nix                   # additions (custom pkgs) + modifications
pkgs/                                  # custom packages (backup script), available as pkgs.<name> via overlay
```

## Key Conventions

- **One concern per file.** Each `.nix` file handles a single program, service, or system aspect.
- **`default.nix` as aggregators.** Directories like `nixos/programs/`, `nixos/services/` use `default.nix` to import all siblings. To add a new program, create the file AND add it to `default.nix`.
- **Module args pattern:** `{ config, pkgs, ... }:` or `{ inputs, pkgs, config, ... }:`. Don't add unused args.
- **`inputs` is available everywhere** via `specialArgs` / `extraSpecialArgs` in flake.nix.
- **Reference packages via `config`**, e.g. `${config.programs.foot.package}/bin/footclient`, not hardcoded store paths.
- **Use `config.home.homeDirectory`** instead of hardcoded `/home/moritz`.
- **Commit style:** lowercase, short, descriptive. Examples: `fix syncthing tray`, `remove docker`, `use hyprpaper home-manager module`.

## Impermanence

The ThinkPad wipes `/` on every reboot (BTRFS snapshot restore). Only `/persist` and `/nix` survive.

When adding stateful programs, you MUST add their directories to:
- **System:** `hosts/nixos/common/impermanence.nix` (`environment.persistence."/persist".directories`)
- **User:** `home-manager/nixos/default.nix` (`home.persistence."/persist".directories`)

## Secrets

SOPS + age via `sops-nix`. All secrets in `hosts/nixos/thinkpad/secrets.yaml`. Age key derived from SSH host key at `/persist/etc/ssh/ssh_host_ed25519_key`.

- System secrets (user passwords): `hosts/nixos/thinkpad/configuration.nix`
- Home-manager secrets (vdirsyncer credentials): `home-manager/nixos/programs/sops.nix`
- `users.mutableUsers = false` -- passwords can only be changed via sops.

## Theming

Catppuccin (frappe/blue) applied globally via `catppuccin/nix` flake input. Imported in both NixOS and darwin home-manager defaults. Waybar uses `mode = "createLink"`.

## Platform Notes

- **NixOS user:** `moritz`. **Darwin user:** `moritzwaldleben`.
- **Darwin hostname** in flake is `"MacBook-Pro"` (with hyphens).
- Calendar/contacts modules are in `common/` but depend on sops -- only used on NixOS.
- Neovim config is in a separate repo; only the package is installed here.
- No CI/CD. Changes applied manually.
