{ ... }:
{
  home.file = {
    ".config/nvim" = {
      enable = true;
      recursive = true;
      source = fetchGit {
        url = "https://github.com/santo-pc/my-nvim-work.git";
        rev = "1c8be2d9b08e18a2031aeb26d9c535f444a8acb2";
      };
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
