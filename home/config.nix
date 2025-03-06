{ config, ... }:
let 
  configDir = ./config;
in
{
  home.file = {
    ".config/nvim" = {
      enable = true;
      recursive = true;
      # needed to write lock files when updating for instance
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/mynixos/home/config/nvim";
    };

    ".config/nvim-kickstart".source = "${configDir}/nvim-kickstart";
    ".config/alacritty".source = "${configDir}/alacritty";
    ".config/i3".source = "${configDir}/i3";
    ".config/hypr".source = "${configDir}/hypr";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wofi".source = "${configDir}/wofi";
    ".config/mako".source = "${configDir}/mako";
  };
}
