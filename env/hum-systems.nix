{ config, ... }:

{
  networking.wireless.networks."Hum-Systems 2.0" = {
    priority = 10;
    pskRaw = "25dfd4ff46ea91eb044d5becf3cc6b04f53bdbf451bb59343ce3db3a78c0c97e";
  };

  services.openvpn.servers.hum = {
    autoStart = false;
    config = '' config /etc/nixos/secrets/hum-systems/openvpn/config.ovpn '';
    updateResolvConf = true;
  };
}
