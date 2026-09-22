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

  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
  };
  networking.hostName = "nixos";
  system.stateVersion = "26.05";
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
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

  services.xserver.xkb = {
    layout = "us";
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

  # Packages
  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  # Services
  services.gnome.gnome-keyring.enable = true;
  services.dbus.enable = true;
  services.chrony.enable = true;

  services.displayManager.ly = {
    enable = true;
    settings = {
      bigclock = "en";
      clear_password = true;
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

  # Programs
  programs.amnezia-vpn.enable = true;
  programs.sway.enable = true;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
