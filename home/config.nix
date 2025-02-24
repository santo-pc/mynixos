let 
  configDir = ./config;
in
{
  home.file = {
    ".config/nvim".source = "${configDir}/nvim";
    ".config/nvim-kickstart".source = "${configDir}/nvim-kickstart";
    ".config/alacritty".source = "${configDir}/alacritty";
    ".config/i3".source = "${configDir}/i3";
    ".config/hypr".source = "${configDir}/hypr";
    #".config/tmux".source = "${configDir}/tmux";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wofi".source = "${configDir}/wofi";
  };
}
