{ config, pkgs, hyprland, ... }:

{
  home.username = "san";
  home.homeDirectory = "/home/san";
  imports = [
    ./programs
    ./config.nix
    ./java.nix
    ./shell.nix
    ./tmux.nix
  ];

  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # DEV
    jetbrains.idea-ultimate
    kitty 
    vscode
    alacritty
    maven
    python3
    nodejs
    cargo 
    rustc
    go
    redis
    openssl_3
    ncpamixer

    # Utils
    ripgrep
    neofetch
    jq          # A lightweight command-line JSON processor
    yq-go       # yaml processor
    fzf         # A command-line fuzzy finder
    fd
    cowsay
    which
    gawk
    obsidian    # Note-taking app
    eza         # Modern replacement of ls
    zoxide      # Zoxide is a smarter cd command  
    zip
    xz
    unzip
    p7zip
    gh          # github ctl

  ];

  programs.firefox = {
    enable = true;

  };

# basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Santiago Palacio";
    userEmail = "sapalacio2@gmail.com";
  };

# programs.alacritty = {
#   enable = true;
#   # custom settings
#   settings = {
#     env.TERM = "xterm-256color";
#     font = {
#       size = 9;
#       draw_bold_text_with_bright_colors = true;
#     };
#     scrolling.multiplier = 5;
#     selection.save_to_clipboard = true;
#   };
# };
#
#
  programs.kitty.enable = true; 
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

}
