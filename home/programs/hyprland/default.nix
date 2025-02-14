{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hyprland-environment.nix
  ];

  home.packages = with pkgs; [ 
    waybar
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
