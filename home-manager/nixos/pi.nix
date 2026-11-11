{
  config,
  pkgs,
  inputs,
  ...
}:
let
  jail = inputs.jail-nix.lib.init pkgs;
  home = config.home.homeDirectory;

  pi = jail "pi" pkgs.pi-coding-agent (
    with jail.combinators;
    [
      network
      (readonly "/nix/store")
      (readonly "/etc/profiles")
      (readonly "/etc/static")
      (readonly "/run/current-system")
      (readonly "/lib64")
      (try-fwd-env "NIX_LD")
      (try-fwd-env "NIX_LD_LIBRARY_PATH")
      (try-readonly "/etc/nix")
      (try-readwrite "/nix/var/nix/daemon-socket")
      (set-env "NIX_REMOTE" "daemon")
      (add-path "/etc/profiles/per-user/${config.home.username}/bin:/run/current-system/sw/bin")
      (try-fwd-env "COLORTERM")
      (try-fwd-env "TERMINFO")
      (try-fwd-env "LOCALE_ARCHIVE")
      (readwrite "${home}/.pi")
      (try-readwrite "${home}/.pi-lens")
      (try-readwrite "${home}/.claude")
      (set-env "CLAUDE_CONFIG_DIR" "${home}/.claude")
      (try-readonly "${home}/.config/git")
      (add-runtime ''
        root=$(${pkgs.git}/bin/git rev-parse --show-toplevel 2>/dev/null || pwd)
        if [ "$root" = "${home}" ] || [ "$root" = / ]; then
          echo "pi: refusing to share $root" >&2
          exit 1
        fi
        RUNTIME_ARGS+=(
          --bind "$root" "$root"
          --ro-bind-try "$root/.git/config" "$root/.git/config"
          --ro-bind-try "$root/.git/hooks" "$root/.git/hooks"
          --chdir "$PWD"
        )
      '')
    ]
  );
in
{
  home.packages = [ pi ];
}
