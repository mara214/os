{ config, pkgs, ... }:

{
  services.fwupd.enable = true;
  services.openssh.enable = true;

  services.cron = {
    enable = true;
    mailto = "mara@schulke.xyz";
    systemCronJobs = [
      "0 12 * * *  max  DROPBOX_CLI='/home/mara/.local/bin/dropbox-sh' /home/mara/.zsh/utils/backup now"
    ];
  };

  services.ssmtp = {
    enable = true;
    root = "mara@schulke.xyz";
    settings = {
      rewriteDomain = "schulke.xyz";
    };
    hostName = "smtp.gmail.com:465";
    authUser = "schulkemaximilian@gmail.com";
    authPassFile = "/etc/nixos/secrets/mail/pass";
    useTLS = true;
  };
}
