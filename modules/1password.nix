{
  globals,
  ...
}:
{

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "${globals.user.username}" ];
  };

}
