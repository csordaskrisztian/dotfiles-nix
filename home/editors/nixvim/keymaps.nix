{...}: {
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      {
        mode = "n";
        action = "<Esc>";
        key = "<cmd>nohlsearch<CR>";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>g";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>f";
      }
      {
        action = "<cmd>Telescope diagnostics<CR>";
        key = "<leader>d";
      }
      {
        action = "<cmd>Telescope keymaps<CR>";
        key = "<leader>ch";
      }

      {
        mode = "t";
        action = "<C-\\><C-n>";
        key = "<Esc><Esc>";
      }
      {
        key = "<leader>e";
        action = ":Neotree toggle reveal_force_cwd<cr>";
        # action = "<CMD>NvimTreeToggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>ge";
        action = ":Neotree git_status<CR>";
        options = {
          silent = true;
          desc = "Git explorer";
        };
      }
      {
        # Format file
        key = "<leader>q";
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
      }
      {
        mode = "n";
        key = "<C-c>";
        action = "<Plug>(comment_toggle_linewise_current)";
      }
      {
        mode = "v";
        key = "<C-c>";
        action = "<Plug>(comment_toggle_linewise_visual)";
      }
      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<cr><esc>";
        options = {
          silent = true;
          desc = "Save file";
        };
      }
      {
        mode = "n";
        key = "<Up>";
        action = "<Nop>";
        options = {
          silent = true;
          noremap = true;
          desc = "Disable Up arrow key";
        };
      }
      {
        mode = "n";
        key = "<Down>";
        action = "<Nop>";
        options = {
          silent = true;
          noremap = true;
          desc = "Disable Down arrow key";
        };
      }
      {
        mode = "n";
        key = "<Right>";
        action = "<Nop>";
        options = {
          silent = true;
          noremap = true;
          desc = "Disable Right arrow key";
        };
      }
      {
        mode = "n";
        key = "<Left>";
        action = "<Nop>";
        options = {
          silent = true;
          noremap = true;
          desc = "Disable Left arrow key";
        };
      }
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Cycle to next buffer";
        };
      }

      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Cycle to previous buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>lua require('bufferline.commands').unpin_and_close()<cr>";
      }
    ];
  };
}
