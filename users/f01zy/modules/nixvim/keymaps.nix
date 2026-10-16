{ ... }: {
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<CR>";
    }
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m +1<CR>";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m -2<CR>";
    }
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>NvimTreeToggle<CR>";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>NvimTreeFocus<CR>";
    }
    {
      mode = "n";
      key = "<leader>rn";
      action.__raw = "function() return ':IncRename ' .. vim.fn.expand('<cword>') end";
      options = {
        expr = true;
      };
    }
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<CR>";
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<CR>";
    }
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>bdelete<CR>";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<A-h>";
      action = "<cmd>ToggleTerm<CR>";
    }
    {
      mode = "t";
      key = "<Esc>";
      action = "<C-\\><C-n>";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<CR>";
    }
  ];
}
