{ ... }:
{
  home.file = {
    ".config/nvim" = {
      enable = true;
      recursive = true;
      source = builtins.fetchGit {
        url = "https://github.com/santo-pc/my-nvim-work.git";
        rev = "ebe3395fe013918720244ae8e78c1f1abea45a13";
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
