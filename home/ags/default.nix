{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    ags
  ];
  home.file.".config/ags/" = {
    # source = ./config;
    source = inputs.self + "/home/ags/config";
    recursive = true; # 递归整个文件夹
  };
}
