{ config, pkgs, ... }:

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

  networking.firewall.allowedTCPPorts = [ ];
  environment.systemPackages = with pkgs; [ google-cloud-sdk ];
  environment.sessionVariables = with pkgs; rec {
    SODIUM_USE_PKG_CONFIG = "1";
    OPENSSL_DIR = "${pkgs.openssl.dev}";
    OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
  };
}
