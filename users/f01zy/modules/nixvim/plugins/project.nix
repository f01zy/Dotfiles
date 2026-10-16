{ pkgs, ... }: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      fd
    ];

    plugins.project-nvim = {
      enable = true;

      settings = {
        lsp.enabled = true;
        show_hidden = true;
        silent_chdir = false;

        patterns = [
          "CMakeLists.txt"
          ".git"
          ".obsidian"
        ];
      };
    };
  };
}
