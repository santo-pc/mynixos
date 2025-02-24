{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    prefix = "C-Space";

    # Set default terminal and true color
    extraConfig = ''
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

      # Pane navigation bindings
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      bind -n C-k select-pane -U
      bind -n C-j select-pane -D
      bind -n C-h select-pane -L
      bind -n C-l select-pane -R

      # Status bar adjustments
      set -g status-right ""
      set -g status-right-length 0

      # Window switching
      bind -n M-H previous-window
      bind -n M-L next-window
      # Icon styles
      set -g @tokyo-night-tmux_terminal_icon 
      set -g @tokyo-night-tmux_active_terminal_icon 

      # No extra spaces between icons
      set -g @tokyo-night-tmux_window_tidy_icons 0
  '';

  plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank
      pain-control
      logging
      tokyo-night-tmux
    ];
  };
}

