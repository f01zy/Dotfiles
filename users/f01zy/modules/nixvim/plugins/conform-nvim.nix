{ pkgs, ... }: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      prettierd
      nixfmt
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters = {
          prettier = {
            command = "${pkgs.prettierd}/bin/prettierd";
          };
        };
        formatters_by_ft = {
          c = [ "clang-format" ];
          glsl = [ "clang-format" ];
          nix = [ "nixfmt" ];
          html = [ "prettier" ];
          css = [ "prettier" ];
          javascript = [ "prettier" ];
          typescript = [ "prettier" ];
        };
        format_on_save = {
          lsp_fallback = true;
          timeout_ms = 500;
        };
      };
    };
  };
}
