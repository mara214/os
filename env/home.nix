{ config, ... }:

{
  networking.wireless.networks."functional" = {
    priority = 10;
    pskRaw = "8ecd321fb7b1b30f57a92889e0cdcd85e946a9baa8acdb91ade6ab10ac7fdea6";
  };
}
