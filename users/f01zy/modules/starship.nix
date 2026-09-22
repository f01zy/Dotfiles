{ ... }: {
  programs.starship = {
    enable = true;

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      add_newline = true;
      git_branch.style = "bold mauve";

      character = {
        success_symbol = "[[󰄛](green) ❯](peach)";
        error_symbol = "[[󰄛](red) ❯](peach)";
        vimcmd_symbol = "[󰄛 ❮](subtext1)";
      };

      directory = {
        truncation_length = 4;
        style = "bold lavender";
      };
    };
  };
}
