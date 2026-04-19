{ pkgs, ... }:
let
  resurrectDirPath = "~/.config/tmux/resurrect";
in
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";

    baseIndex = 1;
    prefix = "C-Space";

    # Set default terminal and true color
    extraConfig = ''
      set-option -g default-shell ${pkgs.nushell}/bin/nu
      set -g default-command ${pkgs.nushell}/bin/nu

      set -g default-terminal "$TERM"
      set -ag terminal-overrides ",$TERM:Tc"

      set -g mouse on

      # Set prefix
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix

      set -s escape-time 0
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      set-option -g repeat-time 0
      set -g pane-border-lines heavy

      # Pane navigation bindings
      # bind -n M-Left select-pane -L
      # bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      bind -n C-k select-pane -U
      bind -n C-j select-pane -D
      bind -n C-h select-pane -L
      bind -n C-l select-pane -R


      # toggle window
      bind l last-window
      bind -n M-Left previous-window
      bind -n M-Right next-window

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Copy mode
      setw -g mode-keys vi
      # bind-key -t vi-copy 'v' begin-selection     # Begin selection in copy mode.
      # bind-key -t vi-copy 'C-v' rectangle-toggle  # Begin selection in copy mode.
      # bind-key -t vi-copy 'y' copy-selection      # Yank selection in copy mode.
      # Avoid jump after selecting
      bind -T copy-mode MouseDragEnd1Pane send-keys -X copy-selection-no-clear

      # Status bar adjustments
      set -g status-right ""
      set -g status-right-length 0

      # Window switching
      bind -n M-H previous-window
      bind -n M-L next-window

    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank
      pain-control
      resurrect
      logging
      {
        plugin = rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant 'main' # Options are 'main', 'moon' or 'dawn'
        '';
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-dir ${resurrectDirPath}
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
        '';
      }

    ];
  };
}
