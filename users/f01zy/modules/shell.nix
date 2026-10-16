{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      se = "sudoedit";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
      cb = "cmake --build . -j4";
      tw = "timew";
    };
  };

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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
