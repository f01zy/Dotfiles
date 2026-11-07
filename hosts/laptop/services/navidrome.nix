{ pkgs, ... }: {
  services.navidrome = {
    enable = true;
    openFirewall = true;

    plugins = with pkgs.navidromePlugins; [
      discord-rich-presence
    ];

    settings = {
      MusicFolder = "/srv/media/Music";
      DataFolder = "/var/lib/navidrome";
      Port = 9501;
      Address = "0.0.0.0";
    };
  };
}
