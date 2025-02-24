{ pkgs, ... }:

{
   fonts.packages = with pkgs; [
     font-awesome 
     jetbrains-mono
     noto-fonts
     noto-fonts-cjk-sans
     noto-fonts-emoji
  
     (nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" ]; })
   ];
}
