{ pkgs }:
pkgs.writeShellScriptBin "now-playing" ''
  player="mpd"
  playerctl="${pkgs.playerctl}/bin/playerctl"
  status=$($playerctl -p $player status 2>/dev/null)
  artist=$($playerctl -p $player metadata --format "{{xesam:artist}}" 2>/dev/null)
  title=$($playerctl -p $player metadata --format "{{xesam:title}}" 2>/dev/null)
  if [[ -z "$status" || -z "$artist" || -z "$title" || "$status" == "Stopped" || "$status" == "Paused" ]]; then
    exit 1
  fi
  echo "{\"text\": \"  $artist - $title\"}"
''
