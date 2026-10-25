{ ... }: {
  programs.nixvim = {
    extraConfigLua = ''
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "${../snippets}" }
      })
    '';

    plugins.luasnip = {
      enable = true;

      settings = {
        enable_autosnippets = true;

        update_events = [
          "TextChanged"
          "TextChangedI"
        ];
      };
    };
  };
}
