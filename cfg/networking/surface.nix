{ config, ... }:

{
  networking.hostName = "surface";
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    interfaces = [ "wlp0s20f3" ];
  };

  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  networking.interfaces.wwp0s20f0u7.useDHCP = true;

  networking.firewall = {
    allowedTCPPorts = [
      53 139 443 445 515 631 9100 9001 9102	# printers
      1701                                  # weylus
      80 443 3000 5000 8000                 # http server
    ];
    allowedUDPPorts = [
      53 137 161 5353                       # printers
      1194                                  # openvpn
    ];
  };
}
