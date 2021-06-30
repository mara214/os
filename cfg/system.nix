{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  boot.kernelParams = [ "intel_idle.max_cstate=1" "acpi_backlight=vendor" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    efiSupport = true;
  };

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = [ pkgs.vaapiIntel ];
  };

  virtualisation.docker.enable = true;
}
