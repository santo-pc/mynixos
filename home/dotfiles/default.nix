{ ... }:
{
  home.file = {
    ".config/nvim" = {
      enable = true;
      recursive = true;
      source = builtins.fetchGit {
        url = "https://github.com/santo-pc/my-nvim-work.git";
        rev = "a69f54c05f48fae8d9672ddaa581e5009cfb8caf";
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
