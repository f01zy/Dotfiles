{ ... }: {
  programs.nixvim.plugins.inc-rename = {
    enable = true;
    settings = {
      cmd_name = "IncRename";
    };
  };
}
