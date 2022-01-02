{ config, pkgs, ... }:

{
  users.users = {
    mara = {
      uid = 1000;
      description = "Mara Schulke";
      extraGroups = [ "wheel" "networkmanager" "docker" "audio" "video" "lp" ];
      isNormalUser = true;
      shell = pkgs.zsh;
    };
    root.shell = pkgs.zsh;
  };
}
