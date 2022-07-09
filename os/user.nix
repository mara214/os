{ config, pkgs, ... }:

{
  users.mutableUsers = false;
  users.users = {
    mara = {
      uid = 1000;
      description = "Mara Schulke";
      extraGroups = [ "wheel" "networkmanager" "docker" "audio" "video" "lp" "libvirtd" ];
      isNormalUser = true;
      hashedPassword = "$6$Pa3222xp.3sgTY5a$lE6tmrGYfiq6wcl//eyPlkBcxyiJBt1hdAwe0b0quVauDiTwXOy2OJE9o1w3rZU8PX.KBUMsll7nG6MYKBYfZ1";
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys  = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINQzqzXz57EF6Z9anpzFhK4a1LscLC+e4W4IWiuJ0d5G mara@schulke.xyz" ];
    };
    root = {
      hashedPassword = "$6$Pa3222xp.3sgTY5a$lE6tmrGYfiq6wcl//eyPlkBcxyiJBt1hdAwe0b0quVauDiTwXOy2OJE9o1w3rZU8PX.KBUMsll7nG6MYKBYfZ1";
      shell = pkgs.zsh;
    };
  };
}
