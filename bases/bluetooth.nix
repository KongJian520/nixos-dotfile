{ lib, pkgs, ... }:
{
  services.blueman.enable = true;
  hardware.bluetooth = {
    powerOnBoot = true;
    enable = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
}
