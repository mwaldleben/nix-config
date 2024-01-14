{ config, ... }: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
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

      # personal prompt
      PROMPT="[%F{blue}%2~%f%b]%# "

      # history search
      bindkey "^p" history-beginning-search-backward
      bindkey "^n" history-beginning-search-forward
    '';
  };

  home.persistence = {
    "/persist/home/${config.home.username}".directories = [ ".config/zsh" ];
  };
}
