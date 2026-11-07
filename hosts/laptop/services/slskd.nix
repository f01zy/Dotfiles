{ ... }: {
  services.slskd = {
    enable = true;
    openFirewall = false;
    environmentFile = "/etc/slskd/env";

    settings = {
      instance_name = "home";

      relay = {
        enabled = true;
        mode = "agent";
        controller = {
          address = "https://slskd.f01zy.xyz";
          ignore_certificate_errors = false;
          downloads = true;
        };
      };

      shares = {
        directories = [
          "/srv/media/Music"
          "/srv/media/Books"
          "/srv/media/Manga"
          "/srv/media/Anime"
          "/srv/media/Movies"
        ];
      };

      directories = {
        downloads = "/var/lib/slskd/downloads";
        incomplete = "/var/lib/slskd/incomplete";
      };

      cache = {
        storage_mode = "memory";
      };

      web = {
        port = 5030;
      };
    };
  };

  systemd.services.slskd.serviceConfig = {
    UMask = "0002";
  };
}
