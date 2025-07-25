
{ config, pkgs, pkgs-unstable,... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop
    # eza
    fzf
    git
    gnumake
    lm_sensors
    kdePackages.sddm-kcm
    # qtwayland
    # libsForQt5.qt5.qtquickcontrols2
    # libsForQt5.qt5.qtgraphicaleffects
    # libsForQt5.qt5.qtsvg
    # libsForQt5.plasma-framework   
    neofetch
    neovim
    rust-analyzer
    ripgrep
    tldr
    unzip
    openssl
    openssl.dev
    pkg-config
    wget
    xfce.thunar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    zip
    zoxide
    gcc
    stylua
    pyright
    ruff
    tmux
  ];
}

