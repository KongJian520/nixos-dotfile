{ lib, pkgs, ... }:
let
  mihomoGeoip = pkgs.fetchurl {
    url = "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb";
    sha256 = "sha256-0vchypqbikcz848p7l1rpqyy2ysqp8lpsj9jm8qxmf400f773bgc";
  };
in
{
  services.mihomo = {
    enable = true;
    configFile = ./config.yaml;
  };
}
