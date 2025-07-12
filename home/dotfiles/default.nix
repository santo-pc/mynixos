{ config, ... }:
{
  home.file = {
    ".config/nvim" = {
      enable = true;
      recursive = true;
      # needed to write lock files when updating for instance
      source = config.lib.file.mkOutOfStoreSymlink ./nvim;
    };

    ".config/santi-nvim" = {
      enable = true;
      recursive = true;
      # needed to write lock files when updating for instance
      source = config.lib.file.mkOutOfStoreSymlink ./santi-nvim;
    };

    ".config/alacritty".source = ./alacritty;
    ".config/i3".source = ./i3;
    ".config/hypr".source = ./hypr;
    ".config/waybar".source = ./waybar;
    ".config/wofi".source = ./wofi;
    ".config/mako".source = ./mako;
    ".config/ghostty".source = ./ghostty;
  };
}
