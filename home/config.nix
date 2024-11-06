let 
  configDir = .config;
in
{
  home.file = {
    ".config/alacritty".source = "${configDir}/alacritty/.config/alacritty";
    ".config/i3".source = "${configDir}/i3/.config/i3";
    ".config/kitty".source = "${configDir}/kitty/.config/kitty";
    ".config/nvim".source = "${configDir}/nvim/.config/nvim";
    ".config/picom".source = "${configDir}/picom/.config/picom";
    ".config/polybar".source = "${configDir}/polybar/.config/polybar";
    ".config/ranger".source = "${configDir}/ranger/.config/ranger";
    ".config/tmux".source = "${configDir}/tmux/.config/tmux";
  };
}
