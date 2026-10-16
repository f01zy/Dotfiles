{ pkgs, ... }: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      tree-sitter
    ];

    plugins.treesitter = {
      enable = true;

      settings = {
        highlight = {
          enable = true;
        };
      };

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        markdown
        markdown_inline
        latex
        yaml
        bash
        lua
        nix
        c
      ];
    };
  };
}
