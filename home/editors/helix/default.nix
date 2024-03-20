{
  inputs,
  pkgs,
  ...
}: {

  imports = [ ./languages.nix ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages.${pkgs.system}.helix;

    extraPackages = with pkgs; with nodePackages; [
      vscode-langservers-extracted
      vscode-css-languageserver-bin
      marksman
      rust-analyzer
      typescript
      typescript-language-server
    ];

   themes = {
     everblush_transparent = {
      "inherits" = "everblush";
      "ui.popup" = {
        fg = "white";
        bg = "black";
      };
      "ui.statusline" = {fg = "green";};
      "ui.statusline.inactive" = {fg = "cursorline";};
      "ui.statusline.normal" = {fg = "cursorline"; bg = "green";};
      "ui.statusline.insert" = {fg = "cursorline"; bg = "blue";};
      "ui.statusline.select" = {fg = "cursorline"; bg = "magenta";};
      "ui.statusline.primary" = {bg = "#1a1a1a";};
      "ui.virtual.inlay-hint" = {
        fg = "black";
        modifiers = ["italic"];
      };
      "ui.background" = "{}";
      
    };
   };

    settings = {

      theme = "everblush_transparent";
      
      editor = {
      
        color-modes = true;
        cursorline = true;
        bufferline = "always";
        true-color = true;
        soft-wrap.enable = true;
        
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        indent-guides = {
          render = true;
          rainbow-option = "dim";
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        gutters = ["diagnostics" "line-numbers" "spacer" "diff"];

        statusline = {
          left = ["mode" "version-control" "spinner" "file-name" "file-modification-indicator"];
          center = [];
          right = ["diagnostics" "selections" "position-percentage" "file-type"];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
        
      };

      keys.normal = {
        C-s = [":w"];

        tab = ["goto_next_buffer"];
        S-tab = ["goto_previous_buffer"];

        space = {
          x = ":buffer-close";
          q = ":fmt";
        };
      };
    };
  };
}
