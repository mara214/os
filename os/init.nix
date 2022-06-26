{ config, ... }:

{
  imports = [
    ./io.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./desktop.nix
  ];
}
