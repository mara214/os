{ config, ... }:

{
  networking.hostName = "nix";
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    interfaces = [ "wlp0s20f3" ];
    networks = {
      "MOCCU" = {
        priority = 20;
        auth = ''
           key_mgmt=WPA-EAP
           eap=TTLS
           identity="maximilians"
           password=hash:49d1225fe88e8ad6a4004c323bb30e0b
           ca_cert="/home/max/.config/moccu/ca.cert"
        '';
      };

      "functional" = {
        priority = 10;
        pskRaw = "8ecd321fb7b1b30f57a92889e0cdcd85e946a9baa8acdb91ade6ab10ac7fdea6";
      };

      "iPhone von Maximilian" = {
        priority = 5;
        pskRaw = "7df600e96ebcb2b40256ffa5fda984a2d0adfbbfec90587b7333c1e84db122f0";
      };

      "FRITZ!Box 6591 Cable SL" = {
        priority = 10;
        pskRaw = "03ad621a15efec9644dff8d79d2295c3f797b4f271a0165ddb32b97a108aa571";
      };

      "FRITZ!WLAN Repeater 1750E" = {
        priority = 5;
        pskRaw = "39f695f4891905e06b2bd6917925a3421197a4056c1551777f53ccb1e0140742";
      };
    };
  };

  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  networking.interfaces.wwp0s20f0u7.useDHCP = true;

  networking.firewall = {
    allowedTCPPorts = [
      53 139 443 445 515 631 9100 9001 9102	# printers
      3000 5000 8000                        # http server
    ];

    allowedUDPPorts = [
      53 137 161 5353                       # printers
      1194                                  # openvpn
    ];
  };
}
