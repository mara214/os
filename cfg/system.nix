{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        version = 2;
        device = "nodev";
        efiSupport = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "intel_idle.max_cstate=1"
      "acpi_backlight=vendor"
      "acpi_osi='!Windows 2013'"
      "acpi_osi=Linux"
      "nogpumanager"
    ];
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
