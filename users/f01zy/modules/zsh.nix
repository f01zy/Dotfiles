{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "alanpeabody";
    };

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      se = "sudoedit";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
      cb = "cmake --build . -j4";
      tw = "timew";
    };
  };
}
