{ config, pkgs, ... }: 

{

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
    ];
  };

  
  programs = {
    hyprland = {
      enable = true;

      xwayland = {
        enable = true;
      };

      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    # Needed to run dynamically linked executables 
    # https://nix.dev/guides/faq#how-to-run-non-nix-executables
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged programs
        rpc
        lua-language-server
      ];
    };

  };

}
