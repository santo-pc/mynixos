
{ config, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    sessionVariables = {
      EDITOR = "nvim";
      ZSH_THEME="typewritten";
      TYPEWRITTEN_PROMPT_LAYOUT="pure";
      TYPEWRITTEN_SYMBOL="$";
      XCURSER_THEME="Bibata-Original-Classic";
      
    };

    shellAliases = {
      ll = "eza -l";
      ls = "eza -la";
      k = "kubectl";
      # Fuzzy open project with idea
      "santi-nvim" = "NVIM_APPNAME=\"santi-nvim\" nvim";
      oidea="fd . '/Users/s.palacio-caro/programming/repository' --type d --hidden --exclude .git  --max-depth 1 | fzf | xargs -I {} idea {}";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
      custom = "$HOME/.oh-my-zsh/custom";
      theme = "typewritten/typewritten";
    };

    # Ensure Typewritten is installed
    initContent = ''
      ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
      if [[ ! -d "$ZSH_CUSTOM/themes/typewritten" ]]; then
        git clone --depth=1 https://github.com/reobin/typewritten.git "$ZSH_CUSTOM/themes/typewritten"
      fi
      ZSH_THEME="typewritten"
      TYPEWRITTEN_PROMPT_LAYOUT="pure"
      TYPEWRITTEN_SYMBOL="$"
  
      # Install zsh-autosuggestions
      if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
        git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
      fi
         source "$ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

     # Install zsh-syntax-highlighting
     if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
       git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
     fi
       source "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

      # Zoxide setup
      eval "$(zoxide init zsh)"

      alias santi-nvim="NVIM_APPNAME='santi-nvim' nvim"

    '';
  };

}
