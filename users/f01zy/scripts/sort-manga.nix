{ pkgs, ... }:
pkgs.writeShellScriptBin "sort-manga" ''
  set -euo pipefail
  SERIES_NAME="''${SERIES_NAME:-$(basename "$PWD")}"
  pad2() { printf "%02d" "$((10#$1))"; }
  pad3() { printf "%03d" "$((10#$1))"; }
  format_chapter() {
    local ch="$1"
    if [[ "$ch" == *.* ]]; then
      local whole="''${ch%%.*}"
      local frac="''${ch#*.}"
      echo "$(pad3 "$whole").$frac"
    else
      pad3 "$ch"
    fi
  }
  shopt -s nullglob
  for archive in *.zip; do
    [ -f "$archive" ] || continue
    vol_num="$(echo "$archive" | sed -E 's/.*Том[_ ]?([0-9]+).*/\1/')"
    if [[ ! "$vol_num" =~ ^[0-9]+$ ]]; then
      echo "! не удалось вытащить номер тома: $archive"
      continue
    fi
    v="$(pad2 "$vol_num")"
    tmp="$(mktemp -d)"
    echo "==> $archive  →  Vol.$v"
    unzip -q -o "$archive" -d "$tmp"
    mapfile -t chapters < <(
      find "$tmp" -type f -iname '*.jpg' -printf '%f\n' \
        | sed -E 's/.*chapter_([0-9]+([.][0-9]+)?).*/\1/' \
        | grep -E '^[0-9]+([.][0-9]+)?$' \
        | sort -V -u
    )
    if [ "''${#chapters[@]}" -eq 0 ]; then
      echo "  ! глав не найдено"
      rm -rf "$tmp"
      continue
    fi
    for chapter in "''${chapters[@]}"; do
      c="$(format_chapter "$chapter")"
      out="''${SERIES_NAME} - Vol.''${v} Ch.''${c}.cbz"
      if [ -f "$out" ]; then
        echo "  = уже есть: $out"
        continue
      fi
      ch_tmp="$(mktemp -d)"
      find "$tmp" -type f -iname "*chapter_''${chapter}_page_*.jpg" -print0 \
        | sort -z -V \
        | while IFS= read -r -d ''' f; do
            mv "$f" "$ch_tmp/"
          done
      shopt -s nullglob
      pages=("''$ch_tmp"/*.jpg)
      if [ "''${#pages[@]}" -eq 0 ]; then
        echo "  ! нет страниц для главы $chapter"
        rm -rf "$ch_tmp"
        continue
      fi
      zip -q -j "$out" "''${pages[@]}"
      rm -rf "$ch_tmp"
      echo "  + $out  (''${#pages[@]} стр.)"
    done
    rm -rf "$tmp"
  done
  echo "Готово."
''
