# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c5251eea-6d1b-4ceb-9d72-2bdbd8756099";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/0eebf0a4-f062-4eb9-9315-19ede629a9e6";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B5C7-5E64";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/78f34107-772f-4315-8e11-5b13717fc591"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
