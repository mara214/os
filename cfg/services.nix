{ config, pkgs, ... }:

{
  services.fwupd.enable = true;
  services.openssh.enable = true;
  services.openvpn.servers = {
    moccu = {
      autoStart = false;
      config = '' config /home/max/.config/openvpn/moccu/config.ovpn '';
      updateResolvConf = true;
    };
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
