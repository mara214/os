{ config, pkgs, ... }:

{
  services.printing.enable = true;
  services.blueman.enable = true;
  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio = {
    enable = true;
    daemon = {
      config = {
        enable-deferred-volume = "no";
      };
    };
    package = pkgs.pulseaudioFull; 
    extraModules = [ pkgs.pulseaudio-modules-bt ];
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.hsphfpd.enable = true;
  hardware.bluetooth.package = pkgs.bluezFull;
}
