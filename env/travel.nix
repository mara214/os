{ config, ... }:

{
  networking.wireless.networks."iPhone von Maximilian" = {
    priority = 5;
    pskRaw = "7df600e96ebcb2b40256ffa5fda984a2d0adfbbfec90587b7333c1e84db122f0";
  };
}
