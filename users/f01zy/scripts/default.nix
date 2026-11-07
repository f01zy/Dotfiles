{ pkgs, ... }: {
  home.packages = [
    (import ./wallpaper.nix { inherit pkgs; })
    (import ./widget-popup.nix { inherit pkgs; })
    (import ./sort-manga.nix { inherit pkgs; })
  ];
}
