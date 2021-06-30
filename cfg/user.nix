{ config, pkgs, ... }:

{
  users.users.max = {
    isNormalUser = true;
    description = "Maximilian Schulke";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" "audio" "video" ];
  };
  users.users.root.shell = pkgs.zsh;
}
