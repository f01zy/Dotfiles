{ ... }: {
  imports = [
    ./alpha.nix
    ./telescope.nix
    ./treesitter.nix
    ./bufferline.nix
    ./lsp.nix
    ./conform-nvim.nix
    ./cmp.nix
    ./cord.nix
    ./obsidian.nix
    ./inc-rename.nix
    ./toggleterm.nix
    ./auto-session.nix
    ./lualine.nix
  ];

  programs.nixvim.plugins = {
    wakatime.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    nvim-tree.enable = true;
    web-devicons.enable = true;
    dressing.enable = true;
    gitsigns.enable = true;
    nvim-autopairs.enable = true;
    render-markdown.enable = true;
  };
}
