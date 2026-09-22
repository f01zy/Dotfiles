{ pkgs, ... }: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "lf.desktop";
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
    };
  };

  xdg.desktopEntries = {
    lf = {
      name = "lf";
      genericName = "File Manager";
      exec = "${pkgs.foot}/bin/foot ${pkgs.lf}/bin/lf %u";
      icon = "system-file-manager";
      terminal = false;
      categories = [
        "Utility"
        "FileManager"
        "ConsoleOnly"
      ];
      mimeType = [ "inode/directory" ];
    };
  };
}
