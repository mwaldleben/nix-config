{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l --color=auto";
      vim = "nvim";
      zathura = "zathura --fork > /dev/null 2>&1";
      no = "sudo nixos-rebuild --flake . switch";
      hm = "home-manager --flake . switch";
      H = "Hyprland";
      # btrfs workaround for trash-cli, https://github.com/andreafrancia/trash-cli/issues/300#issuecomment-1786065185 
      trash = "TRASH_ENABLE_HOME_FALLBACK=1 trash-put --home-fallback";
    };
    history.path = "$HOME/.config/zsh/history";
    initExtra = ''
      # share history between open terminals
      setopt share_history

      # vim bindings
      bindkey -v
      bindkey -v '^?' backward-delete-char # in vi backspace binding is different 

      # exports
      export EDITOR=nvim

      # history search
      bindkey "^p" history-beginning-search-backward
      bindkey "^n" history-beginning-search-forward

      # custom prompt
      prompt_nix_shell() {
        if [[ -n "$IN_NIX_SHELL" ]]; then
          echo -n "%F{yellow}(nix-shell)%f "
        fi
      }

      export VIRTUAL_ENV_DISABLE_PROMPT=1
      prompt_virtualenv() {
        local virtualenv_path="$VIRTUAL_ENV"
        if [[ -n $virtualenv_path ]]; then
          local env_name=$(basename "$virtualenv_path")
          echo -n "%F{magenta}($env_name)%f "
        fi
      }

      prompt_git_branch() {
        local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        if [[ -n $branch ]]; then
          echo -n " %F{green}($branch)%f"
        fi
      }

      setopt PROMPT_SUBST
      PROMPT='$(prompt_virtualenv)$(prompt_nix_shell)[%F{blue}%2~%f%b]$(prompt_git_branch)%# '

      # Wait for window resize when starting alacritty
      sleep 0.05
    '';
  };

  home.persistence = {
    "/persist/home/${config.home.username}".directories = [ ".config/zsh" ];
  };
}
