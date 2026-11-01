{ pkgs, ... }: {
  imports = [
    ./slskd.nix
    ./kavita.nix
    ./navidrome.nix
  ];

  services = {
    resolved.enable = true;
    usbmuxd.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    chrony.enable = true;

    xserver.xkb = {
      layout = "us";
    };

    displayManager.ly = {
      enable = true;
      settings = {
        bigclock = "en";
        clear_password = true;
      };
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };
  };
}
