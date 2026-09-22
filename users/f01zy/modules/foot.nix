{ ... }: {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Iosevka Nerd Font:size=12";
        pad = "0x0";
      };

      colors = {
        alpha = 0.8;
      };
    };
  };
}
