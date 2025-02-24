{ config, pkgs, ... }:

{
  users.users.san = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ 
      "wheel"
      "networkmanager"
      "docker"
      "input"
    ]; 
  };
}




