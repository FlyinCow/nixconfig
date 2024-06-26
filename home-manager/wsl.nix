{ config, lib, pkgs, features, inputs, dotfiles, ... }:

{
  imports = [
    ./home.nix # home-manager configuration
    ./global # imports per-app configuration of those will be installed in every machine
    ./wsl
  ];
}
