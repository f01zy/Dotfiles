{ ... }: {
  programs.fastfetch = {
    enable = true;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        source = "nixos_small";

        padding = {
          top = 2;
          right = 4;
          left = 4;
        };
      };

      display = {
        separator = " ";
      };

      modules = [
        "break"
        "break"
        {
          type = "title";
        }
        "break"
        {
          type = "os";
          key = " ";
          keyColor = "cyan";
          format = "{pretty-name}";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "cyan";
        }
        {
          type = "packages";
          key = " ";
          keyColor = "cyan";
          format = "{} (nix)";
        }
        {
          type = "uptime";
          key = " ";
          keyColor = "cyan";
        }
        {
          type = "memory";
          key = " ";
          keyColor = "cyan";
          format = "{used} / {total}";
        }
        {
          type = "disk";
          key = "󰋊 ";
          keyColor = "cyan";
          folders = "/";
        }
        "break"
        {
          type = "colors";
          symbol = "circle";
        }
        "break"
        "break"
      ];
    };
  };
}
