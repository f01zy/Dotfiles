{ ... }: {
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      frontmatter.enabled = false;
      ui.enable = false;
      legacy_commands = false;
      new_notes_location = "current_dir";
      workspaces = [
        {
          name = "Main";
          path = "/home/f01zy/Obsidian";
        }
      ];
    };
  };
}
