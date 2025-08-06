{
  pkgs,
  pkgs-unstable,
  globals,
  ...
}:

{
  home.username = "san";
  home.homeDirectory = "/home/san";

  imports = [
    ./programs
    ./dotfiles
    ./shell
    ./java.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # DEV
    # jetbrains.idea-ultimate
    # jetbrains.idea-community
    pkgs-unstable.neovim
    kitty
    vscode
    alacritty
    ghostty
    maven
    python3
    nodejs
    cargo
    rustc
    rustfmt
    go
    redis
    openssl_3
    ncpamixer
    blueberry
    impala
    elixir

    # NVIM deps
    stylua
    pyright
    ruff
    tmux
    lua-language-server
    lua
    luarocks
    nil # nix lsp
    tree-sitter
    nixd
    nixfmt-rfc-style
    elixir-ls

    # Utils
    ripgrep
    neofetch
    jq # A lightweight command-line JSON processor
    yq-go # yaml processor
    fzf # A command-line fuzzy finder
    fd
    cowsay
    which
    gawk
    obsidian # Note-taking app
    eza # Modern replacement of ls
    zoxide # Zoxide is a smarter cd command
    zip
    xz
    unzip
    p7zip
    gh # github ctl
    libevdev # for setting mouse dps
  ];

  programs.firefox = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = globals.user.gitUserName;
    userEmail = globals.user.gitEmail;
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  programs.kitty.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
