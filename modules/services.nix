{ config, pkgs, ... }:

{
  services = {

    dbus.enable = true;
    picom.enable = true;
    openssh.enable = true;
    spice-vdagentd.enable = true;
    displayManager ={
      defaultSession = "none+i3";
      autoLogin.enable = true;
      autoLogin.user = "san";
    };
    

    xserver = {
      enable = true;
      xkb.layout = "us";
      
      windowManager.i3.enable = true;
      windowManager.i3.package = pkgs.i3-gaps;
      # windowManager.hyprland.enable = true;

      displayManager = {
        # defaultSession = "none+i3";
        # lightdm.enable = true;
        # autoLogin.enable = true;
        # autoLogin.user = "san";
        sddm.enable = true;
        sddm.wayland.enable = true;
        # sddm.theme = "where_is_my_sddm_theme"; 
      };
    };
  };
}

