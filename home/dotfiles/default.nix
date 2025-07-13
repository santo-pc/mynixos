{ config, ... }:
{
  home.file = {
    ".config/nvim" = {
      # needed to write lock files
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/mynixos/home/dotfiles/nvim";
    };

    ".config/lazy-nvim" = {
      # needed to write lock files
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/mynixos/home/dotfiles/lazy-nvim";
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
