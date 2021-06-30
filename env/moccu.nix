{ config, lib, pkgs, ... }

{
  services.openvpn.servers = {
    moccu = {
      autoStart = false;
      config = '' config /etc/secrets/moccu.ovpn '';
      updateResolvConf = true;
    };
  };

  fileSystems."/home/max/Documents/gerda/Exchange" = {
    device = "//gerda.moccu/Exchange";
    fsType = "cifs";
    options = [ "noauto" "user" "uid=1000" "gid=100" "iocharset=utf8" "x-systemd.requires=openvpn-moccu.service" "credentials=/etc/nixos/secrets/moccu/credentials" ];
  };

  fileSystems."/home/max/Documents/gerda/Projekte" = {
    device = "//gerda.moccu/Projekte";
    fsType = "cifs";
    options = [ "noauto" "user" "uid=1000" "gid=100" "iocharset=utf8" "x-systemd.requires=openvpn-moccu.service" "credentials=/etc/nixos/secrets/moccu/credentials" ];
  };

  fileSystems."/home/max/Documents/gerda/Moccu" = {
    device = "//gerda.moccu/Moccu";
    fsType = "cifs";
    options = [ "noauto" "user" "uid=1000" "gid=100" "iocharset=utf8" "x-systemd.requires=openvpn-moccu.service" "credentials=/etc/nixos/secrets/moccu/credentials" ];
  };

  security.wrappers = {
    "mount.cifs".source = "${pkgs.cifs-utils}/bin/mount.cifs";
  };
}
