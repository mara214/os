{ config, ... }:

{
  imports = [
    ./xhain.nix
    ./livy.nix
    ./study.nix
    ./travel.nix
    ./holiday.nix
  ];
}
