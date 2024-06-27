{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles/nixconfig#wsl";
    };
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
}
