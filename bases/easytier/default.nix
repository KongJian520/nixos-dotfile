{
  config,
  lib,
  pkgs,
  ...
}:

{
  config.services.easytier = {
    enable = true;
    instances = {
      web = {
        enable = true;
        configFile = ./config.toml;
      };
    };
  };
}