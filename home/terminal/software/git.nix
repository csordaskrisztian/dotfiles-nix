{
  pkgs,
  config,
  ...
}: {
 home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "csordaskrisztian";
    userEmail = "73989259+csordaskrisztian@users.noreply.github.com";
    signing = {
      key = "7E34EB412C479CB2";
      signByDefault = true;
    };

    delta = {
      enable = true;
    };

  };

  xdg.configFile."git/config".recursive = true;
  # xdg.configFile."git".recursive = true;
}
