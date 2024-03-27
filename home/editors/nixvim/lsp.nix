{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim.plugins = {
    none-ls.enable = true;
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        nil_ls.settings.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
        cssls.enable = true;
        cssls.extraOptions = {css.lint.unknownAtRules = "ignore";};
        lua-ls.enable = true;
        jsonls.enable = true;
        marksman.enable = true;
        denols.enable = true;
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
