{ config, pkgs, ... }:

{
  services.fwupd.enable = true;
  services.openssh.enable = true;

  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 12 * * * max /home/max/.zsh/utils/backup now"
    ];
  };

  systemd.services.backlight-permissions = {
    description = "Fix the backlight permissions";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/run/current-system/sw/bin/chmod 666 /sys/class/backlight/intel_backlight/brightness";
      User = "root";
    };
    wantedBy = [ "default.target" ];
  };
}
