{ config, pkgs, ... }:

{
  services = {

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    dbus.enable = true;
    picom.enable = true;
    openssh.enable = true;
    spice-vdagentd.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      
      windowManager.i3.enable = true;
      displayManager.defaultSession = "none+i3";
      displayManager.lightdm.enable = true;
      displayManager.autoLogin.enable = true;
      displayManager.autoLogin.user = "san";
    };
  };
}

