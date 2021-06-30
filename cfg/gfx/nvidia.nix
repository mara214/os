{ config, ... }:

{
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:7:0:0";
      sync.enable = true;
      sync.allowExternalGpu = true;
    };
}
