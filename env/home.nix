{ config, ... }:

{
  networking.wireless.networks."FRITZ!Box 6660 Cable YX" = {
    priority = 10;
    pskRaw = "3a1ed09d80f8757ff6d254c1bc2bd5fd28db6be7e3b582a1fe41bd9e32f84d5d";
  };
}
