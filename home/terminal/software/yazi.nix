{
  pkgs,
  config,
  ...
}: {
  programs.yazi = {
    enable = true;
    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;

    # settings = {
    #   opener = {
    #     text = [
    #       {exec = "'hx \"$@\"'"; block = true; }
    #     ];
    #   };
    # };
  };
}
