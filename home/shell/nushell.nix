{ pkgs, ... }:
let 
  zoxideInit = pkgs.zoxide;
in
{

  programs = {
    nushell = { 
      enable = true;
      # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
      # configFile.source = ./.../config.nu;
      # for editing directly to config.nu 
      envFile.text = ''
        ${zoxideInit}/bin/zoxide init nushell | save -f ~/.zoxide.nu
      '';

      configFile.text =  ''
        source ~/.zoxide.nu
        def oidea [] {
           fd . '$env.HOME/programming/repository' --type d --hidden --exclude .git  --max-depth 1 -a 
           | fzf 
           | lines  
           | get 0 
           | ^idea $in
        }
        def oi [] {
          oidea
        }
        
        def lazy-nvim [...args] {
          with-env {NVIM_APPNAME: 'lazy-nvim'} {
            nvim ...$args
          }
        }

        def santi-nvim [...args] {
          with-env {NVIM_APPNAME: 'nvim'} {
            nvim ...$args
          }
        }
      '';

      extraConfig = ''
        let carapace_completer = { |spans|
          carapace $spans.0 nushell ...$spans | from json
        }
        $env.config = {
         show_banner: false,
         completions: {
          case_sensitive: false    # case-sensitive completions
          quick: true              # set to false to prevent auto-selecting completions
          partial: true            # set to false to prevent partial filling of the prompt
          algorithm: "fuzzy"       # prefix or fuzzy
          external: {
            # set to false to prevent nushell looking into $env.PATH to find more suggestions
            enable: true 
            # set to lower can improve completion performance at the cost of omitting some options
            max_results: 100 
              completer: $carapace_completer # check 'carapace_completer' 
           }
          }
        }
        zoxide init nushell | save -f ~/.zoxide.nu
        '';

      shellAliases = {
        # ll = "eza -l";
        ls = "ls -la";
        k = "kubectl";
        vim = "neovim";
        kcontext-all = "kubectl config get-contexts";
        kcontext-current = "kubectl config current-context";
        mnix-rebuild = "nix run nix-darwin -- switch --flake $env.HOME/mynixos/ --show-trace"; 
        mnix-update = "sh $env.HOME/mynixos/scripts/update-system.sh";
      };

    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = { 
        enable = true;
        settings = {
          add_newline = true;
          aws = {
              disabled = true;
          };
          character = {
         };
        format = ''
        $directory$git_branch
        $shell$character
        '';
      };
    };
  };

}
