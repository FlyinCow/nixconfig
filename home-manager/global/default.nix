# # imports per-app configuration of those will be installed in every machine
{ ... }:

{
  imports = [
    ./zsh.nix
    ./git.nix
  ];
}
