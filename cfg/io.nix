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
    extraModules = [ pkgs.pulseaudio-modules-bt ];
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.hsphfpd.enable = true;
  hardware.bluetooth.package = pkgs.bluezFull;

  services.printing.enable = true;
  services.blueman.enable = true;

  # TODO: this does not work yet, should retrigger xorg init when keyboard goes to sleep
  services.udev.extraRules = ''
    ACTION=="bind", ATTRS{idVendor}=="046D", ATTRS{idProduct}=="B35B", RUN+="${xprofile}"
  '';
}
