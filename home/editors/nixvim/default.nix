{
  inputs,
  theme,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./keymaps.nix
    ./lualine.nix
    ./lsp.nix
    ./cmp.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      transparentBackground = true;
      flavour = "mocha";
      terminalColors = true;
      integrations = {
        cmp = true;
        neotree = true;
        gitsigns = true;
        which_key = true;
        treesitter = true;
        telescope.enabled = true;
      };
      colorOverrides.all = {
        red = "#e57474";
        green = "#8ccf7e";
        peach = "#e5c76b";
        blue = "#67b0e8";
        mauve = "#c47fd5";
        sky = "#6cbfbf";
        pink = "#e781d6";

        maroon = "#ef7e7e";
        teal = "#96d988";
        yellow = "#f4d67a";
        lavender = "#71baf2";
        flamingo = "#ce89df";
        sapphire = "#67cbe7";
        rosewater = "#d76dc5";

        text = "#dadada";
        subtext1 = "#dbdbdb";
        subtext2 = "#cacaca";

        overlay2 = "#b2b5b3";
        overlay1 = "#a8aba9";
        overlay0 = "#9ea19f";

        surface2 = "#353331";
        surface1 = "#2f2e2d";
        surface0 = "#2c2a2a";

        base = "#171717";
        mantle = "#111111";
        crust = "#0a0a0a";
      };
    };
    # colorschemes.tokyonight = {
    #   enable = true;
    #   transparent = true;
    #   styles.sidebars = "transparent";
    #   style = "storm";
    # };

    clipboard.providers.wl-copy.enable = true;

    options = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      smartindent = true;
      shiftwidth = 2;
      # inccommand = "split";
      cursorline = true;
      hlsearch = true;
      incsearch = true;
      wrap = true;
      splitbelow = true;
      splitright = true;
      mouse = "a";
      updatetime = 50;
      # completeopt = ["menuone" "noselect" "noinsert"];
      termguicolors = true;
      showmode = false;
      autoindent = true;
      scrolloff = 5;
    };

    plugins = {
      diffview.enable = true;
      gitsigns.enable = true;
      comment.enable = true;
      lint.enable = true;
      fidget.enable = true;
      which-key.enable = true;
      bufferline = {
        enable = true;
        diagnostics = "nvim_lsp";
        # separatorStyle = "thick";
        # indicator.style = "underline";
        offsets = [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
          }
        ];
        highlights = {
          indicatorSelected.sp = "#89b4fa";
        };
      };
      nix.enable = true;
      luasnip.enable = true;
      navic.enable = true;
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          ui-select.enable = true;
          file_browser.enable = true;
        };
      };
      nvim-colorizer.enable = true;
      nvim-autopairs.enable = true;
      wilder.enable = true;
      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
        # popupBorderStyle = "rounded";
        window = {
          autoExpandWidth = true;
          mappings = {
            "<space>" = "none";
            "l" = "open";
            "h" = "close_all_subnodes";
            "L" = "open_vsplit";
          };
        };
      };
      treesitter = {
        enable = true;
        nixGrammars = true;
        indent = true;
        nixvimInjections = true;
      };

      cmp-nvim-lsp = {enable = true;}; # lsp
      cmp-buffer = {enable = true;};
      cmp-path = {enable = true;}; # file system paths
      cmp_luasnip = {enable = true;}; # snippets
    };
  };
}
