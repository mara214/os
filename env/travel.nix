{ config, ... }:

{
  networking.wireless.networks."iPhone von Mara" = {
    priority = 5;
    pskRaw = "df1d85621f9119d7258e8c517a6cae382a08cb916d6e855ca3487bb7ec5b1d3b";
  };
}
