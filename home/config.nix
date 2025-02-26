{ config, ... }:
let 
  configDir = ./config;
in
{
  home.file = {
    ".config/nvim"= {
      enable = true;
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${configDir}/nvim";
    };

    # ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/nvim";
    ".config/nvim-kickstart".source = "${configDir}/nvim-kickstart";
    ".config/alacritty".source = "${configDir}/alacritty";
    ".config/i3".source = "${configDir}/i3";
    ".config/hypr".source = "${configDir}/hypr";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wofi".source = "${configDir}/wofi";
  };
}
