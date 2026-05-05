{
  pkgs,
  globals,
  ...
}:
{
  home.packages = with pkgs; [
    _1password-cli
    _1password-gui
  ];
  # Enable the unfree 1Password packages
  # nixpkgs.config.allowUnfreePredicate =
  #   pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "1password-cli"
  #     "1password-gui"
  #     "1password"
  #   ];

  # programs._1password.enable = true;
  # programs._1password-gui = {
  #   enable = true;
  #   polkitPolicyOwners = [ "${globals.user.username}" ];
  # };
}
