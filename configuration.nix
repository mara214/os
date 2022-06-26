{ config, ... }:

{
  imports = [
    ./os/init.nix
    ./env/init.nix
    ./system.nix
  ];

  system.stateVersion = "21.11";
}
