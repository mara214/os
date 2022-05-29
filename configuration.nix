{ config, ... }:

{
  imports = [
    ./cfg/desktop.nix
    ./cfg/io.nix
    ./cfg/packages.nix
    ./cfg/services.nix
    ./cfg/system.nix
    ./cfg/user.nix

    ./env/bielefeld.nix
    ./env/home.nix
    ./env/hum-systems.nix
    ./env/travel.nix
    ./env/university.nix

    ./system.nix
  ];

  system.stateVersion = "21.11";
}
