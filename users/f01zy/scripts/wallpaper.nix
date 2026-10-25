{ pkgs }:
pkgs.writeShellScriptBin "wallpaper" ''
  CACHE_FILE="$HOME/.cache/current_wallpaper"
  DIR="$HOME/Media/Wallpapers"

  start_daemon() {
    if ! ${pkgs.procps}/bin/pgrep -x ".awww-daemon-wr" > /dev/null; then
      ${pkgs.awww}/bin/awww-daemon &
      sleep 1
    fi
  }

  apply_wallpaper() {
    local bg="$1"
    if [ -n "$bg" ] && [ -f "$bg" ]; then
      echo "$bg" > "$CACHE_FILE"
      start_daemon
      ${pkgs.awww}/bin/awww img "$bg" --transition-type simple --transition-step 10 --transition-fps 60
    fi
  }

  case "$1" in
    init)
      if [ -f "$CACHE_FILE" ]; then
        apply_wallpaper "$(${pkgs.coreutils}/bin/cat "$CACHE_FILE")"
      fi
      ;;
    random)
      if [ -d "$DIR" ]; then
        BG=$(${pkgs.findutils}/bin/find "$DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | ${pkgs.coreutils}/bin/shuf -n1)
        apply_wallpaper "$BG"
      fi
      ;;
    set)
      if [ -n "$2" ]; then
        apply_wallpaper "$2"
      fi
      ;;
    get-list)
      if [ -d "$DIR" ]; then
        ${pkgs.findutils}/bin/find "$DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | ${pkgs.coreutils}/bin/sort -V | ${pkgs.jq}/bin/jq -R . | ${pkgs.jq}/bin/jq -s .
      else
        echo "[]"
      fi
      ;;
    get-current)
      if [ -f "$CACHE_FILE" ]; then
        ${pkgs.coreutils}/bin/cat "$CACHE_FILE"
      else
        echo ""
      fi
      ;;
    *)
      echo "Using: wallpaper {init|random|set <path>|get-list|get-current}"
      exit 1
      ;;
  esac
''
