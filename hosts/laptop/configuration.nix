{ pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  system.stateVersion = "26.05";
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "nixos";
    networkmanager.dns = "systemd-resolved";
    firewall.checkReversePath = "loose";

    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
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

    komga = {
      enable = true;
      openFirewall = true;
      stateDir = "/var/lib/komga";
      settings.server.port = 9500;
    };

    displayManager.ly = {
      enable = true;
      settings = {
        bigclock = "en";
        clear_password = true;
      };
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
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
  };
}
