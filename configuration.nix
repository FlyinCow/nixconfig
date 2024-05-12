# system level configurations
{ config, lib, pkgs, inputs, me, ... }:

{  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.proxy = {
    httpProxy = "http://127.0.0.1:7890";
    httpsProxy = "http://127.0.0.1:7890";
  };

  services.sshd.enable = true;

  users.users.${me} = {
    createHome = true;
    home = "/home/${me}";
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
  
  nix.settings.substituters = lib.mkBefore [
    "https://mirror.sjtu.edu.cn/nix-channels/store"
    #"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    #"https://mirrors.bfsu.edu.cn/nix-channels/store"
  ];  

  environment.systemPackages = with pkgs; [
    # tools
    wget
    curl
    zip
    # tar
    vim
    file
    # dev toolchain
    git
    gh
    libgcc
    cmake
    nodejs

    # zsh & plugins
    zsh
    oh-my-zsh
    zsh-autosuggestions
  ];

  # zsh configurations
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "fino";
      plugins = [
        "git"
        "themes"
        # no need to write this
        #"zsh-autosuggestions"
      ];
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
