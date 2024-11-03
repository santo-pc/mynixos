{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hyprland-environment.nix
  ];

  home.packages = with pkgs; [ 
    waybar
    # swww
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
  };
}
