{
  imports = [
    ./tmux.nix
    ./zsh.nix
    ./nushell.nix
  ];

  programs.atuin = {
    enable = true;
  };

}
