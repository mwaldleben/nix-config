{
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
      no = "nixos-rebuild --flake . switch";
      hm = "home-manager --flake . switch";
      H = "Hyprland";
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
}
