{ config, ... }:

{
  imports = [
    ./os/init.nix
    ./env/init.nix
    ./system.nix
  ];

  system.stateVersion = "22.05";
}
