let
  user = {
    host = "santiago-ws";
    username = "san";
    password-1p-item = "personal-nix";
    homeDirectory = "/home/san";
    nixConfigDirectory = "/home/san/mynixos";
    # git
    gitUserName = "santiago palacio";
    gitEmail = "sapalacio2@gmail.com";
  };
in
{
  inherit
    user
    ;
}
