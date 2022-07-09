{ config, pkgs, ... }:

{
  nixpkgs.config.pulseaudio = true;

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    daemon = {
      config = {
        enable-deferred-volume = "no";
      };
    };
    package = pkgs.pulseaudioFull; 
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.hsphfpd.enable = true;
  hardware.bluetooth.package = pkgs.bluezFull;

  services.printing.enable = true;
  services.blueman.enable = true;
}
