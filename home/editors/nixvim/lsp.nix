{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        nil_ls.settings.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
        cssls.enable = true;
        jsonls.enable = true;

        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          settings = {
            checkOnSave = true;
            check = {
              command = "clippy";
            };
            # inlayHints = {
            #   enable = true;
            #   showParameterNames = true;
            #   parameterHintsPrefix = "<- ";
            #   otherHintsPrefix = "=> ";
            # };
            procMacro = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
