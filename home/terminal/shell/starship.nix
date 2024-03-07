{config, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      character = {
        success_symbol = "[›](bold green)";
        error_symbol = "[›](bold red)";
      };

      git_status = {
        deleted = "✗";
        modified = "✶";
        staged = "✓";
        stashed = "≡";
      };

      username = {
        style_user = "cyan bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };

      nix_shell = {
        symbol = " ";
        # heuristic = true;
        disabled = false;
      };
    };
  };
}
