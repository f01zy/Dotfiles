{ ... }: {
  programs.beets = {
    enable = true;
    settings = {
      directory = "/home/f01zy/Media/Music";
      library = "/home/f01zy/.config/beets/library.db";

      import = {
        move = true;
        write = true;
        copy = false;
      };

      plugins = [
        "musicbrainz"
        "ftintitle"
        # "fetchart"
        # "embedart"
        # "lyrics"
        # "lastgenre"
        # "scrub"
      ];

      ftintitle.auto = true;

      paths = {
        default = "$albumartist/$album%aunique{}/$track - $title";
        singleton = "$artist/Singles/$title";
        comp = "Compilations/$album%aunique{}/$track - $title";
      };
    };
  };
}
