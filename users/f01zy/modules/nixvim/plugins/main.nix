{ ... }: {
  imports = [
    ./alpha.nix
    ./telescope.nix
    ./treesitter.nix
    ./bufferline.nix
    ./conform-nvim.nix
    ./lsp.nix
    ./cmp.nix
    ./inc-rename.nix
    ./luasnip.nix
    ./toggleterm.nix
    ./lualine.nix
    ./auto-session.nix
    ./project.nix
    ./obsidian.nix
    ./render-markdown.nix
    ./cord.nix
  ];

  programs.nixvim.plugins = {
    wakatime.enable = true;
    nvim-tree.enable = true;
    web-devicons.enable = true;
    gitsigns.enable = true;
    nvim-autopairs.enable = true;
    neogit.enable = true;
  };
}
