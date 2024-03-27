{config, ...}: {
  programs.yazi = {
    enable = true;
    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;

    # settings = {
    #   opener = {
    #     text = [
    #       {
    #         exec = "'hx \"$@\"'";
    #         block = true;
    #       }
    #     ];
    #     text1 = [
    #       {
    #         exec = "'nvim \"$@\"'";
    #         block = true;
    #       }
    #     ];
    #   };
    #   open = {
    #     rules = [
    #       {
    #         mime = "text/*";
    #         use = ["text" "text1"];
    #       }
    #     ];
    #   };
    # };
  };
}
