{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    catppuccin.enable = false;

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-dir '$HOME/.local/share/tmux/plugin/resurrect/'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];
    extraConfig = ''
      ### general settings ###
      # setting the prefix from C-b to C-Space
      set -g prefix C-Space
      unbind C-b

      # destroy when detached
      set -g destroy-unattached on

      # set statusline
      set -g status on

      # enable mouse
      set -g mouse on

      # set vi as the default editor
      set -g status-keys vi

      # set TERM variable
      set -g default-terminal "xterm-256color"
      set -sg terminal-overrides ",*:RGB"

      # setting the delay between prefix and command
      set -s escape-time 5

      # set the base index for windows to 1 instead of 0
      set -g base-index 1

      # set the base index for panes to 1 instead of 0
      set -g pane-base-index 1

      # renumber windows in statusbar
      set-option -g renumber-windows on

      # set focus events
      set -g focus-events on


      ### keybindings ###
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind M-h resize-pane -L 3
      bind M-j resize-pane -D 3
      bind M-k resize-pane -U 3
      bind M-l resize-pane -R 3

      # splitting panes with s and v
      unbind s
      bind s split-window -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"

      # rebind new window
      unbind n
      bind o new-window

      # don't ask for confirmation to kill
      bind d if-shell -F "#{!=:#{window_panes},1}" kill-pane "confirm-before -p 'kill-window #W? (y/n)' kill-window"
      bind x confirm-before -p "kill-window #W? (y/n)" kill-window

      # pane movement
      # bind-key p command-prompt -p "join pane from:"  "join-pane -s '%%'"
      bind-key m command-prompt -p "send pane to:"  "join-pane -t '%%'"

      # swap windows in statusbar
      bind-key -n M-H swap-window -t -1
      bind-key -n M-L swap-window -t +1

      # if renamed don't destroy, see https://superuser.com/questions/1540409/kill-all-unnamed-sessions
      bind-key -r '$' command-prompt "rename-session '%%'" \; set -s destroy-unattached off

      # set bind key to reload configuration file
      bind r source-file $HOME/.config/tmux/tmux.conf \; display "tmux config reloaded"


      ### copy mode ###
      # use vim keybindings in copy mode
      setw -g mode-keys vi
      set-option -s set-clipboard off
      bind P paste-buffer
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy'
      unbind -T copy-mode-vi Enter
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'wl-copy'
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'wl-copy'


      ### status bar ###
      # set the status bar options
      set -g status-right-length 40
      set-option -g status-right "%a %d %b %Y %H:%M"
      setw -g window-status-current-format '#I:#W'
      setw -g window-status-format '#I:#W'


      ### colors ###
      # set status bar color
      set -g status-style fg=black
      set-window-option -g window-status-current-style fg=white

      # border color
      set -g pane-border-style fg=black
      set -g pane-active-border-style fg=black

      # message color
      set -g message-style fg=white

      # scroll color
      set-option -g mode-style fg=white,bg=black
    '';
  };
}
