{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.services.easytier = {
    enable = true;
    instances = {
      # **这是缺失的实例名称/Key**
      web = {
        enable = true;
        configFile = ./config.toml
      };
    };
  };
}