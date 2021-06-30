{ config, pkgs, ... }:

{
  services.fwupd.enable = true;
  services.openssh.enable = true;

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
