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
    ./tmux
    ./scripts
    ./1password
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # DEV
    # jetbrains.idea-ultimate
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
    impala
    erlang
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
    nixfmt
    elixir-ls

    # Utils
    lazygit
    ripgrep
    fastfetch
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
    gh # xgithub ctl
    libevdev # for setting mouse dps
    cliphist
  ];

  programs.firefox = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = globals.user.gitUserName;
      email = globals.user.gitEmail;
    };
    signing.format = null;
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
