{ ... }: {
  programs.nixvim.plugins.render-markdown = {
    enable = true;

    settings = {
      completions.lsp.enabled = true;
      render_modes = [
        "n"
        "c"
        "t"
      ];

      heading = {
        enabled = true;
        sign = false;
        icons = [ "" ];
        position = "inline";
      };
    };
  };
}
