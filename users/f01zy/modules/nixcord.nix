{ ... }: {
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;

    config = {
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css"
      ];
    };
  };
}
