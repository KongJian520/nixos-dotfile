{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000"; # 背景颜色设为黑色
      show-failed-attempts = true; # 显示失败次数
      ring-color = "ffff00"; # 锁定环的颜色
    };
  };
  programs.niri.enable = true;
  home.file.".config/niri/" = {
    source = ./config;
    # source = inputs.self + "/home/niri/config";
    recursive = true; # 递归整个文件夹
  };
}
