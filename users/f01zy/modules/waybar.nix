{ ... }: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;

        modules-left = [
          "sway/workspaces"
          "mpris"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "memory"
          "cpu"
          "network"
          "bluetooth"
          "pulseaudio"
          "disk"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          cursor = true;
          format = "{icon}";
          format-icons = {
            default = "";
            empty = "";
            focused = "";
            active = "";
          };
        };

        "mpris" = {
          format = "{dynamic}";
          format-paused = "{dynamic}";
          tooltip-format = "{player} ({status}): {artist} - {title}";
          format-disabled = "";
          interval = 1;
          dynamic-order = [
            "title"
            "artist"
          ];
          dynamic-importance-order = [
            "title"
            "artist"
          ];
        };

        "clock" = {
          format = "{:%A %H:%M %p}";
          tooltip-format = "<span>{calendar}</span>";
          interval = 60;
          calendar = {
            mode = "month";
            mode-mon-col = 2;
            format = {
              month = "<span color='#f6c177'><b>{}</b></span>";
              weekdays = "<span color='#c4a7e7'><b>{}</b></span>";
              today = "<span color='#eb6f92'><b>{}</b></span>";
            };
          };
        };

        "tray" = {
          spacing = 8;
        };

        "memory" = {
          format = "MEM {used:0.1f} GiB";
          tooltip-format = "Used {percentage}%: {used:0.1f}GB/{total:0.1f}GB";
        };

        "cpu" = {
          format = "CPU {usage:2}%";
          tooltip-format = "CPU: {usage}%";
        };

        "network" = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format = "NET";
          format-wifi = "NET {essid}";
          format-ethernet = "NET {ifname}";
          format-disconnected = "NET";
          tooltip-format-wifi = "⇣{bandwidthDownBytes} ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "ETHERNET";
          tooltip-format-disconnected = "Disconnected";
        };

	"bluetooth"= {
	  format= "BT{num_connections}";
	  format-disabled= "BT";
	  format-off= "BT";
	  format-connected= "BT{num_connections}";
	  tooltip-format= "Devices connected: {num_connections}";
	};

        "pulseaudio" = {
          format = "VOL {volume}%";
          format-muted = "VOL muted";
          tooltip-format = "Volume: {volume}%";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        };

        "disk" = {
          format = "DISK {percentage_used}%";
          tooltip-format = "Total ROOT: {used}/{total}";
          unit = "GB";
          path = "/";
          interval = 30;
        };
      };
    };

    style = ''
      * {
	font-family: "Iosevka Nerd Font";
	font-size: 11pt;
	border: none;
	border-radius: 0;
	transition-property: none;
      }

      window#waybar {
	color: #cdd6f4;
	background-color: transparent;
      }

      #waybar > box {
	background-color: #1e1e2e;
	padding: 0 6px;
	border-bottom: 0.5px solid #45475a;
	box-shadow: 1px 1px 3px 1px #11111b;
      }

      #workspaces {
	margin: 0px;
	padding: 0px;
      }

      #workspaces button {
	background: transparent;
	color: #cdd6f4;
	padding: 1px 4px;
	margin: 0px;
	opacity: 0.5;
	font-weight: 900;
      }

      #workspaces button.active,
      #workspaces button.focused {
	color: #cdd6f4;
	background: transparent;
	opacity: 1.0;
      }

      #workspaces button.urgent {
	color: #f38ba8;
	opacity: 1.0;
      }

      #workspaces button.persistent {
	color: #585b70;
      }

      #workspaces button.empty {
	opacity: 1;
	color: #cdd6f4;
      }

      #workspaces button:hover {
	background: transparent;
	color: #cdd6f4;
	opacity: 0.8;
	box-shadow: inherit;
      }

      #clock,
      #network,
      #pulseaudio,
      #cpu,
      #memory,
      #tray,
      #mpris,
      #disk,
      #backlight,
      #battery,
      #window,
      #idle_inhibitor,
      #power-profiles-daemon,
      #bluetooth,
      #custom-weather,
      #custom-update,
      #custom-voxtype,
      #custom-idle-indicator,
      #custom-notification-silencing-indicator,
      #custom-screenrecording-indicator {
	margin: 0px 2px;
	padding: 0.2rem 0.6rem;
	color: #cdd6f4;
	background: transparent;
      }

      #tray {
	margin: 0 0 0 2px;
      }

      #network.disconnected,
      #pulseaudio.muted {
	color: #585b70;
      }

      tooltip {
	background-color: #1e1e2e;
	border: 1px solid #45475a;
	border-radius: 4px;
	padding: 4px 8px;
      }

      tooltip label {
	color: #cdd6f4;
      }
    '';
  };
}
