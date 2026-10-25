{ pkgs, ... }: {
  home.packages = with pkgs; [
    navidrome
  ];

  systemd.user.services.navidrome = {
    Unit = {
      Description = "Navidrome Music Server";
      After = [ "network.target" ];
    };

    Service = {
      ExecStart = "${pkgs.navidrome}/bin/navidrome --musicfolder /home/f01zy/Media/Music --port 9501 --address 0.0.0.0";
      WorkingDirectory = "%h/.local/share/navidrome";
      Restart = "always";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
