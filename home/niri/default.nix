{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.niri.enable = true;
  home.file.".config/niri/" = {
    source = ./config;
    # source = inputs.self + "/home/niri/config";
    recursive = true; # 递归整个文件夹
  };
}
