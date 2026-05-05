{ pkgs, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.awww}/bin/awww-deamon &
    sleep 1
    ${pkgs.awww}/bin/awww img ${./wallpaper.png} &
  '';
in
{
  imports = [
    ./hyprland-environment.nix
    ./hypr-cheat-sheet.nix
  ];
  programs.hypr-cheat-sheet.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = "${startupScript}/bin/start";
    };
  };

}
