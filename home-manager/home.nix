# common home-manager configurations
{ config, pkgs, me, ... }:

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
    zsh-autosuggestions
    fzf
  ];

  # git
  programs.git = {
    enable = true;
    userName = "Bowen Ding";
    userEmail = "bowendean_cow@foxmail.com";
    extraConfig = { github.user = "FlyinCow"; };
  };

  programs.htop.enable = true;
  programs.bat.enable = true;

  programs.zsh = {
    enable = true;
    # autosuggestions.enable = true;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
      theme = "fino";
      plugins = [
        "git"
        "themes"
        "direnv"
        # no need to write this
        #"zsh-autosuggestions"
      ];
    };
  };

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
