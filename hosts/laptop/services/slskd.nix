{ lib, ... }: {
  services.slskd = {
    enable = true;
    openFirewall = false;
    user = "f01zy";
    group = "users";
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
          "/home/f01zy/Media/Music"
          "/home/f01zy/Media/Manga"
          "/home/f01zy/Media/Books"
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
    ProtectHome = lib.mkForce false;
  };
}
