{
  pkgs,
  lib,
  ...
}: {
  programs.helix.languages = {
    language-server = {
      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };
      vscode-css-language-server = {
        command = "${pkgs.nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver";
        args = ["--stdio"];
        config = {
          provideFormatter = true;
          css.validate.enable = true;
          scss.validate.enable = true;
        };
      };
    };

    # language = [
    #   {
    #     name = "nix";
    #     auto-format = true;
    #     language-servers = ["nil"];
    #   }
    # ];
  };
}
