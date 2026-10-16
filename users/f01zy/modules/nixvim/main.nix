{ ... }: {
  imports = [
    ./plugins/main.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";
    clipboard.register = "unnamedplus";

    opts = {
      number = true;
      relativenumber = false;
      shiftwidth = 2;
      langmap =
        "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,"
        + "фисвуапршолдьтщзйкыегмцчняж;abcdefghijklmnopqrstuvwxyz;";
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };

    diagnostic.settings = {
      signs = false;
      virtual_text = {
        spacing = 4;
        prefix = "●";
      };
      underline = true;
      severity_sort = true;
    };

    autoCmd = [
      {
        event = [
          "VimEnter"
          "VimLeave"
        ];
        pattern = "*";
        command = "silent !tmux set status";
      }
    ];
  };
}
