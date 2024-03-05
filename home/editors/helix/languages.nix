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
