{ config, pkgs, ... }:

{
  users.users = {
    max = {
      description = "Maximilian Schulke";
      extraGroups = [ "wheel" "networkmanager" "docker" "audio" "video" ];
      isNormalUser = true;
      shell = pkgs.zsh;
    };
    root.shell = pkgs.zsh;
  };
}
