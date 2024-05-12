{ config, lib, pkgs, features, inputs, dotfiles, ... }:

{
  imports = [
    ./home.nix
    ./global
    ./wsl
  ];
}
