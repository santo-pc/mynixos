{ config, pkgs, ... }:

{
  documentation.nixos.enable = false;
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = tru;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
