{ config, pkgs, ... }:
let
  globals = import ../globals.nix;
in
{
  imports = [
    ./tmux.nix
    ./zsh.nix
    ./nushell.nix
  ];

  # basic configuration of git, please change to your own
   programs.git = {
     enable = true;
     userName = globals.gitUserName;
     userEmail = globals.gitEmail;
   };

}
