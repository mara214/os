{ config, pkgs, ... }:

{
  services.fwupd.enable = true;
  services.openssh.enable = true;
}
