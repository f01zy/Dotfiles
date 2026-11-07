{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./services/default.nix
  ];

  system.stateVersion = "26.05";
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager.dns = "systemd-resolved";

    firewall = {
      enable = true;
      checkReversePath = "loose";
    };

    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
  };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  users.users."f01zy" = {
    isNormalUser = true;
    description = "Aminov Ali";
    shell = pkgs.zsh;
    extraGroups = [
      "media"
      "networkmanager"
      "wheel"
    ];
  };

  users.groups.media = { };
  users.users.kavita.extraGroups = [ "media" ];
  users.users.slskd.extraGroups = [ "media" ];
  users.users.navidrome.extraGroups = [ "media" ];

  systemd.tmpfiles.rules = [
    "d /srv/media                2775 f01zy media -"
    "d /srv/media/Music          2775 f01zy media -"
    "d /srv/media/Manga          2775 f01zy media -"
    "d /srv/media/Anime          2775 f01zy media -"
    "d /srv/media/Movies         2775 f01zy media -"
    "d /srv/media/Books          2775 f01zy media -"
    "d /srv/media/Wallpapers     2775 f01zy media -"
    "Z /srv/media                2775 f01zy media -"
    "d /var/lib/slskd            0755 slskd slskd -"
    "d /var/lib/slskd/downloads  2775 slskd media -"
    "d /var/lib/slskd/incomplete 2775 slskd media -"
    "Z /var/lib/slskd/downloads  2775 slskd media -"
    "Z /var/lib/slskd/incomplete 2775 slskd media -"
  ];

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };

  programs = {
    sway.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;

    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    throne = {
      enable = true;
      tunMode.enable = true;
    };
  };
}
