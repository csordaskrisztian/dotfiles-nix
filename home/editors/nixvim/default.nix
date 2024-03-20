{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.kanagawa = {
      enable = true;
      transparent = true;
    };
    clipboard.providers.wl-copy.enable = true;

    options = {
      number = true;
      relativenumber = true;

      shiftwidth = 2;
    };
    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>g";
      }
    ];

    plugins = {
      bufferline.enable = true;
      lightline.enable = true;
      nix.enable = true;
      nvim-tree.enable = true;
      treesitter.enable = true;
      lualine.enable = true;
      luasnip.enable = true;
      telescope.enable = true;
      oil.enable = true;
      nvim-colorizer.enable = true;

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          nil_ls.settings.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
          # rust-analyzer.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "luasnip";}
          ];
          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };
    };
  };
}
