{ config, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Media/Music";
    dataDir = "${config.home.homeDirectory}/.config/mpd";
    dbFile = "${config.home.homeDirectory}/.config/mpd/database";
    playlistDirectory = "${config.home.homeDirectory}/.config/mpd/playlists";
    network.listenAddress = "127.0.0.1";
    network.port = 6600;

    extraConfig = ''
      log_file "${config.home.homeDirectory}/.config/mpd/log"
      state_file "${config.home.homeDirectory}/.config/mpd/state"
      sticker_file "${config.home.homeDirectory}/.config/mpd/sticker.sql"

      audio_output {
        type "pipewire"
        name "PipeWire Sound Server"
      }

      audio_output {
        type "fifo"
        name "Visualizer feed"
        path "/tmp/mpd.fifo"
        format "44100:16:2"
      }
    '';
  };

  services.mpd-mpris = {
    enable = true;
    mpd.host = "127.0.0.1";
    mpd.port = 6600;
  };

  home.activation.createMpdDirs = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD mkdir -p "${config.home.homeDirectory}/.config/mpd/playlists"
  '';
}
