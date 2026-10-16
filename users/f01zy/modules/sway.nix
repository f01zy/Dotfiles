{ pkgs, lib, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    wrapperFeatures.gtk = true;
    package = pkgs.swayfx;

    config = {
      modifier = "Mod4";

      fonts = {
        names = [ "Iosevka Nerd Font" ];
        size = 10.0;
      };

      gaps = {
        inner = 4;
        outer = 4;
      };

      seat = {
        "*" = {
          xcursor_theme = "Bibata-Modern-Ice 18";
        };
      };

      window = {
        border = 3;
        titlebar = false;
      };

      input = {
        "type:touchpad" = {
          events = "disabled";
        };
        "type:keyboard" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:alt_shift_toggle";
        };
      };

      keybindings =
        let
          mod = "Mod4";
        in
        lib.mkOptionDefault {
          "${mod}+Return" = "exec ${pkgs.foot}/bin/foot tmux new-session -A -s main";
          "${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun -theme launcher";
          "${mod}+Shift+q" = "kill";
          "${mod}+Shift+c" = "reload";

          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          "${mod}+1" = "workspace 1";
          "${mod}+2" = "workspace 2";
          "${mod}+3" = "workspace 3";
          "${mod}+4" = "workspace 4";
          "${mod}+5" = "workspace 5";
          "${mod}+6" = "workspace 6";
          "${mod}+7" = "workspace 7";
          "${mod}+8" = "workspace 8";
          "${mod}+9" = "workspace 9";
          "${mod}+0" = "workspace 10";

          "${mod}+Shift+1" = "move container to workspace 1";
          "${mod}+Shift+2" = "move container to workspace 2";
          "${mod}+Shift+3" = "move container to workspace 3";
          "${mod}+Shift+4" = "move container to workspace 4";
          "${mod}+Shift+5" = "move container to workspace 5";
          "${mod}+Shift+6" = "move container to workspace 6";
          "${mod}+Shift+7" = "move container to workspace 7";
          "${mod}+Shift+8" = "move container to workspace 8";
          "${mod}+Shift+9" = "move container to workspace 9";
          "${mod}+Shift+0" = "move container to workspace 10";

          "${mod}+v" = "splitv";
          "${mod}+s" = "layout stacking";
          "${mod}+t" = "layout tabbed";
          "${mod}+e" = "layout toggle split";
          "${mod}+f" = "fullscreen";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";
          "${mod}+a" = "focus parent";

          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";
          "${mod}+r" = "mode resize";

          "${mod}+b" = "exec zen";
          "${mod}+m" = "exec ${pkgs.foot}/bin/foot lf";
          "${mod}+w" = "exec widget-popup wallpapers";
          "${mod}+Shift+p" = "exec playerctl -p mpd play-pause";
          "${mod}+Shift+w" = "exec wallpaper random";
          "${mod}+Shift+x" = "exec swaylock";
          "Print" = "exec grim -g \"$(slurp)\" -t png - | wl-copy -t image/png";
          "XF86Launch4" = "exec swaylock -f && systemctl suspend";

          "--locked XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "--locked XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "--locked XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "--locked XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          "--locked XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "--locked XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        };

      modes = {
        resize = {
          "h" = "resize shrink width 10px";
          "j" = "resize grow height 10px";
          "k" = "resize shrink height 10px";
          "l" = "resize grow width 10px";
          "Return" = "mode default";
          "Escape" = "mode default";
        };
      };

      bars = [
        { command = "${pkgs.waybar}/bin/waybar"; }
      ];

      startup = [
        {
          command = "swaymsg output VGA-1 disable && swaymsg output VGA-2 disable";
          always = true;
        }
        {
          command = "wallpaper init";
          always = true;
        }
      ];

      colors = {
        focused = {
          border = "#89b4fa";
          childBorder = "#89b4fa";
          background = "#89b4fa";
          text = "#1e1e2e";
          indicator = "#f5e0dc";
        };
      };
    };

    extraConfig = ''
      corner_radius 8
      blur disable
      for_window [app_id="foot"] blur enable
      for_window [app_id="foot"] blur_passes 2
      for_window [app_id="foot"] blur_radius 5
    '';
  };
}
