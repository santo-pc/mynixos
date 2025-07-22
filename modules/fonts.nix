{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome 
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
  ];
}
