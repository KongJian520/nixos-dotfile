{ lib, pkgs, ... }:
{
  services.mihomo = {
    enable = true;
    configFile = ./config.yaml;
  };
}
