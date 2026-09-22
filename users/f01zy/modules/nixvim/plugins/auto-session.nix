{ ... }: {
  programs.nixvim.plugins.auto-session = {
    enable = true;
    settings = {
      autoRestore.enabled = true;
      autoSave.enabled = true;
    };
  };
}
