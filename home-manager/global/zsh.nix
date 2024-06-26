{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
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
