{ ... }: {
  services.kavita = {
    enable = true;
    dataDir = "/var/lib/kavita";
    tokenKeyFile = "/etc/kavita/token.key";
    settings = {
      Port = 9502;
      IpAddresses = "0.0.0.0";
    };
  };

  networking.firewall.allowedTCPPorts = [ 9502 ];
}
