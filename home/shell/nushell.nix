{ pkgs, config, ... }:
let
  zoxideInit = pkgs.zoxide;
  homeDir = config.home.homeDirectory;
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

      configFile.text = ''
        source ~/.zoxide.nu
        $env.config.edit_mode = "vi"
        $env.PROMPT_INDICATOR = ""
        $env.PROMPT_INDICATOR_VI_INSERT = " "
        $env.PROMPT_INDICATOR_VI_NORMAL = " "
        $env.PROMPT_MULTILINE_INDICATOR = "::: "
        def oidea [] {
           fd . '${homeDir}/programming/repository' --type d --hidden --exclude .git  --max-depth 1 -a 
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
        ls = "ls -a";
        k = "kubectl";
        vim = "neovim";
        kcontext-all = "kubectl config get-contexts";
        kcontext-current = "kubectl config current-context";

        ## same but uses 1password to get sudo access
        x-up-1p = "sh ${homeDir}/bin/nix-update-1p.sh";
        x-build-1p = "sh ${homeDir}/bin/nix-build-1p.sh";
      };

    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      enableNushellIntegration = true;
      settings = {
        add_newline = true;
        aws = {
          disabled = true;
        };

        character = { };

        shell = {
          style = "white dimmed";
          fish_indicator = "󰈺 ";
          powershell_indicator = "_";
          unknown_indicator = "mystery shell";
          # style = "cyan bold";
          nu_indicator = "󰫻󰬂";
          zsh_indicator = "󰬇󱎤󰫵";
          disabled = false;
        };

        directory = {
          truncate_to_repo = false;
        };

        format = ''
          $kubernetes$directory$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch$docker_context$cmd_duration$fill$shell
          $character
        '';
      };
    };
  };
}
