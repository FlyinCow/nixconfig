# common home-manager configurations
{ pkgs, me, ... }:
# let
# pkgsUnstable = import <nixpkgs-unstable> {};
# in
{
  home.username = me;
  home.homeDirectory = "/home/${me}";

  home.packages = with pkgs; [
    neofetch
    aria2
    # misc

    # nix related
    nix-output-monitor

    # productivity
    gh
    glow # markdown previewer in terminal
    oh-my-zsh
    # zsh-autosuggestions
    fzf

    # neovim
    # pkgsUnstable.neovim
  ];


  # if further configurations needed they should be in `home-manager/<hostname or global>/<app name>.nix`
  programs.neovim.enable = true;
  programs.htop.enable = true;
  programs.bat.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.

  home.stateVersion = "24.05";
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
