let 
  configDir = ./config;
in
{
  home.file = {
    ".config/alacritty".source = "${configDir}/alacritty/.config/alacritty";
    ".config/i3".source = "${configDir}/i3";
    ".config/hypr".source = "${configDir}/hypr";
  };
}
