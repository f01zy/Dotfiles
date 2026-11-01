{ lib, ... }: {
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      MusicFolder = "/home/f01zy/Media/Music";
      DataFolder = "/var/lib/navidrome";
      Port = 9501;
      Address = "0.0.0.0";
    };
  };

  systemd.services.navidrome.serviceConfig = {
    ProtectHome = lib.mkForce false;
  };
}
