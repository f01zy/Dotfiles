{ pkgs, inputs, ... }: {
  home.username = "f01zy";
  home.homeDirectory = "/home/f01zy";
  home.stateVersion = "26.05";

  # Modules
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.catppuccin.homeModules.catppuccin

    ./modules/nixvim/main.nix
    ./modules/eww/main.nix
    ./modules/foot.nix
    ./modules/shell.nix
    ./modules/fastfetch.nix
    ./modules/sway.nix
    ./modules/waybar.nix
    ./modules/mako.nix
    ./modules/lf.nix
    ./modules/zathura.nix
    ./modules/gnupg.nix
    ./modules/mime.nix
    ./modules/swaylock.nix
    ./modules/swayidle.nix
    ./modules/rofi.nix
    ./modules/mpd.nix
    ./modules/rmpc.nix
    ./modules/tmux.nix
    ./modules/git.nix
    ./modules/catppuccin.nix
    ./modules/cursor.nix
  ];

  # Packages
  home.packages = with pkgs; [
    # Scripts
    (import ./scripts/wallpaper.nix { inherit pkgs; })
    (import ./scripts/now-playing.nix { inherit pkgs; })
    (import ./scripts/widget-popup.nix { inherit pkgs; })

    # Inputs
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Programs
    discord
    telegram-desktop
    obsidian
    obs-studio
    timewarrior
    taskwarrior3
    qalculate-gtk
    picard
    chromaprint
    foliate
    sqlitebrowser

    # Development & Build Tools
    zip
    unzip
    unrar
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
    qimgv
    mpc
    mpv
    bat
    awww
    grim
    slurp
  ];
}
