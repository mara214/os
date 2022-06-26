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
    extraPackages = [];
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
}
