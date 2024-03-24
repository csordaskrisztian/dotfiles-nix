{
  inputs,
  pkgs,
  ...
}: {
  imports = [./languages.nix];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages.${pkgs.system}.helix;

    extraPackages = with pkgs;
    with nodePackages; [
      vscode-langservers-extracted
      vscode-css-languageserver-bin
      marksman
      rust-analyzer
      typescript
      typescript-language-server
      lua-language-server
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
        "ui.statusline.normal" = {
          fg = "cursorline";
          bg = "green";
        };
        "ui.statusline.insert" = {
          fg = "cursorline";
          bg = "blue";
        };
        "ui.statusline.select" = {
          fg = "cursorline";
          bg = "magenta";
        };
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

        auto-pairs = {
          "(" = ")";
          "{" = "}";
          "[" = "]";
          "<" = ">";
          "'" = "'";
          "\"" = "\"";
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        indent-guides = {
          render = true;
          rainbow-option = "dim";
          skip-levels = 1;
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        gutters = ["diagnostics" "line-numbers" "spacer" "diff"];

        statusline = {
          separator = "│";
          left = ["mode" "spinner" "version-control" "file-name" "file-modification-indicator"];
          center = [];
          right = ["diagnostics" "separator" "selections" "separator" "position-percentage" "separator" "file-type"];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
      };
      keys.insert = {
        C-h = "move_char_left";
        C-j = "move_line_down";
        C-k = "move_line_up";
        C-l = "move_char_right";
        C-e = "goto_line_end";
        C-b = "goto_line_start";
      };

      keys.normal = {
        C-s = [":w"];
        "0" = ["goto_line_start"];
        esc = ["collapse_selection" "keep_primary_selection"];

        tab = ["goto_next_buffer"];
        S-tab = ["goto_previous_buffer"];

        A-j = ["extend_to_line_bounds" "delete_selection" "paste_after"];
        A-k = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];
        A-h = ["delete_selection" "move_char_left" "paste_before"];
        A-l = ["delete_selection" "move_char_right" "paste_after"];

        space = {
          x = ":buffer-close";
          q = ":fmt";
        };
      };
    };
  };
}
