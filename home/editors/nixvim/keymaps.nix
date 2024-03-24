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
        mode = "t";
        action = "<C-\\><C-n>";
        key = "<Esc><Esc>";
      }
      {
        # Toggle NvimTree
        key = "<leader>e";
        # action = "<CMD>NvimTreeToggle<CR>";
        action = ":Neotree toggle reveal_force_cwd<cr>";
      }
      {
        # Format file
        key = "<space>fm";
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
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
        mode = ["n" "i"];
        key = "<Up>";
        action = "<Nop>";
        options = {
          silent = true;
          noremap = true;
          desc = "Disable Up arrow key";
        };
      }
      {
        mode = ["n" "i"];
        key = "<Down>";
        action = "<Nop>";
        options = {
          silent = true;
          noremap = true;
          desc = "Disable Down arrow key";
        };
      }
      {
        mode = ["n" "i"];
        key = "<Right>";
        action = "<Nop>";
        options = {
          silent = true;
          noremap = true;
          desc = "Disable Right arrow key";
        };
      }
      {
        mode = ["n" "i"];
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
    ];
  };
}
