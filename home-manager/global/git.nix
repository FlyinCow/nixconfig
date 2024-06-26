{ ... }: {
  programs.git = {
    enable = true;
    # userName = "Bowen Ding";
    userName = "Bowen Dean";
    userEmail = "bowendean_cow@foxmail.com";
    extraConfig = { github.user = "FlyinCow"; };
  };
}
