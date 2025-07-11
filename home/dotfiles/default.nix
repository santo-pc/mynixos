{ config, ... }:
let 
  configDir = ./dotfiles;
in
{
  home.file = {
    ".config/nvim" = {
      enable = true;
      recursive = true;
      # needed to write lock files when updating for instance
      source = config.lib.file.mkOutOfStoreSymlink "${configDir}/nvim";
    };

    ".config/santi-nvim" = {
      enable = true;
      recursive = true;
      # needed to write lock files when updating for instance
      source = config.lib.file.mkOutOfStoreSymlink "${configDir}/santi-nvim";
    };

    ".config/alacritty".source = "${configDir}/alacritty";
    ".config/i3".source = "${configDir}/i3";
    ".config/hypr".source = "${configDir}/hypr";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wofi".source = "${configDir}/wofi";
    ".config/mako".source = "${configDir}/mako";
  };
}
