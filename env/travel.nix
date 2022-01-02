{ config, ... }:

{
  networking.wireless.networks."iPhone von Mara" = {
    priority = 5;
    pskRaw = "cd136d9abb9367a66d47cff4add0cf4138e10ebc924634534c821c76e1e8712d";
  };
}
