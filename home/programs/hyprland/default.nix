{ config, lib, pkgs, ... }:
let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      ${pkgs.waybar}/bin/waybar &
      ${pkgs.swww}/bin/swww init &
  
      sleep 1
  
      ${pkgs.swww}/bin/swww img ${./wallpaper.png} &
    '';
in
{
  imports = [ 
    ./hyprland-environment.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = ''${startupScript}/bin/start'';
    };
  };

}
