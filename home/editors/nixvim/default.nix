{
  pkgs,
  inputs,
  lib,
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
    };
    clipboard.providers.wl-copy.enable = true;

    options = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      smartindent = true;
      shiftwidth = 2;
      inccommand = "split";
      cursorline = true;
      hlsearch = true;
      incsearch = true;
      wrap = true;
      splitbelow = true;
      splitright = true;
      mouse = "a";
      updatetime = 50;
      completeopt = ["menuone" "noselect" "noinsert"];
      termguicolors = true;
      showmode = false;
      autoindent = true;
      scrolloff = 10;
    };

    keymaps = [
    ];

    plugins = {
      diffview.enable = true;
      lint.enable = true;
      fidget.enable = true;
      which-key.enable = true;
      bufferline.enable = true;
      lightline.enable = true;
      nix.enable = true;
      luasnip.enable = true;
      telescope.enable = true;
      nvim-colorizer.enable = true;
      nvim-autopairs.enable = true;
      # nvim-tree = {
      #   enable = true;
      #   openOnSetupFile = true;
      #   autoReloadOnWrite = true;
      # };
      neo-tree = {
        enable = false;
        enableDiagnostics = true;
        enableGitStatus = true;
        enableModifiedMarkers = true;
        enableRefreshOnWrite = true;
        closeIfLastWindow = true;
        popupBorderStyle = "rounded";
        buffers = {
          bindToCwd = false;
          followCurrentFile = {
            enabled = true;
          };
        };
        window = {
          width = 40;
          height = 15;
          autoExpandWidth = false;
          mappings = {
            "<space>" = "none";
          };
        };
      };

      treesitter = {
        enable = true;
        nixGrammars = true;
        indent = true;
        folding = true;
        nixvimInjections = true;
      };

      cmp-nvim-lsp = {enable = true;}; # lsp
      cmp-buffer = {enable = true;};
      cmp-path = {enable = true;}; # file system paths
      cmp_luasnip = {enable = true;}; # snippets
    };
  };
}
