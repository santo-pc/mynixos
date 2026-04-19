{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    btop
    fzf
    git
    gnumake
    lm_sensors
    kdePackages.sddm-kcm
    neovim
    rust-analyzer
    ripgrep
    tldr
    unzip
    openssl
    openssl.dev
    pkg-config
    wget
    thunar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    zip
    zoxide
    gcc
  ];
}
