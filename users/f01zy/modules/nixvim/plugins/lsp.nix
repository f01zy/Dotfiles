{ pkgs, ... }: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      emmet-ls
    ];

    plugins.lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        nixd.enable = true;
        glsl_analyzer.enable = true;
        texlab.enable = true;

        ts_ls = {
          enable = true;
          package = pkgs.typescript-language-server;
        };

        emmet_ls = {
          enable = true;
          filetypes = [
            "html"
            "css"
            "javascript"
            "typescript"
          ];
        };
      };
    };
  };
}
