{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixos-personal";
    networkmanager.enable = true;
  };
}


