{ pkgs, ... }: {
  programs.nixvim.plugins.treesitter = {
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
    ];
  };
}
