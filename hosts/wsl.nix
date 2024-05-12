{features, inputs, home-manager, me, ...}:
# let inherit me; in
{
  wsl = {
    enable = true;
    defaultUser = me;
    startMenuLaunchers = true;
  };

  home-manager.users.${me} = {
    imports = [ ../home-manager/wsl.nix ];
  };

}