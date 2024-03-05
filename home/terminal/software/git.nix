{
  pkgs,
  config,
  ...
}: {
 home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "csordaskrisztian";
    userEmail = "csordas.krisztian03@gmail.com";
    signing = {
      key = "7E34EB412C479CB2";
      signByDefault = true;
    };
  };
}
