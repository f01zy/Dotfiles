{ pkgs, ... }:
let
  lock = "${pkgs.swaylock}/bin/swaylock -f";
  suspend = "${pkgs.systemd}/bin/systemctl suspend";
in
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = lock;
      }
      {
        timeout = 3600;
        command = suspend;
      }
    ];
  };
}
