{ pkgs, inputs, ... }: {
  home.username = "f01zy";
  home.homeDirectory = "/home/f01zy";
  home.stateVersion = "26.05";

  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord
    inputs.catppuccin.homeModules.catppuccin
    ./modules/default.nix
    ./scripts/default.nix
  ];

  home.packages = with pkgs; [
    # Inputs
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Programs
    telegram-desktop
    obsidian
    obs-studio
    qalculate-gtk
    sqlitebrowser
    qbittorrent
    picard
    lrcget
    btop

    # Development & Build Tools
    zip
    unzip
    mosh
    ffmpeg
    cmake
    gnumake
    gcc
    gdb
    emscripten
    python3
    sqlite
    wakatime-cli

    # System & Media Utils
    nerd-fonts.iosevka
    papirus-icon-theme
    ripgrep
    playerctl
    chromaprint
    mpc
    mpv
    bat
    awww
    grim
    slurp
  ];
}
