{ ... }: {
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "horizontal";
      size = 10;
    };
  };
}
