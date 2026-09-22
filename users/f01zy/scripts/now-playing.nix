{ pkgs }:
pkgs.writeShellScriptBin "now-playing" ''
  playerctl="${pkgs.playerctl}/bin/playerctl"
  status=$($playerctl -p rmpc status 2>/dev/null)
  artist=$($playerctl -p rmpc metadata --format "{{xesam:artist}}" 2>/dev/null)
  title=$($playerctl -p rmpc metadata --format "{{xesam:title}}" 2>/dev/null)
  if [[ -z "$status" || "$status" == "Stopped" ]]; then
    exit 1
  elif [[ "$status" == "Paused" ]]; then
    icon="󰏤"
  else
    icon=""
  fi
  if [[ -n "$artist" && -n "$title" && "$status" != "Stopped" ]]; then
    echo "{\"text\": \"$icon  $artist - $title\"}"
  fi
''
