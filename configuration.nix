{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./cfg/desktop.nix
      ./cfg/io.nix
      ./cfg/networking.nix
      ./cfg/packages.nix
      ./cfg/services.nix
      ./cfg/system.nix
      ./cfg/user.nix
      ./cfg/gfx/intel.nix

      ./env/home.nix
      ./env/hum-systems.nix
      ./env/bielefeld.nix
      ./env/travel.nix
    ];

  # Determines NixOS release.
  # Don't change this before reading the docs.
  # https://nixos.org/nixos/options.html
  system.stateVersion = "21.05";
}
