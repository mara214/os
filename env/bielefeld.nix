{ config, ... }:

{
  networking.wireless.networks."FRITZ!Box 6591 Cable SL" = {
    priority = 10;
    pskRaw = "03ad621a15efec9644dff8d79d2295c3f797b4f271a0165ddb32b97a108aa571";
  };
  networking.wireless.networks."FRITZ!WLAN Repeater 1750E" = {
    priority = 5;
    pskRaw = "39f695f4891905e06b2bd6917925a3421197a4056c1551777f53ccb1e0140742";
  };
}
