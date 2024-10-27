{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules
    ];


  system.stateVersion = "22.11";
}
