{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  niriPath = "${config.home.homeDirectory}/.nixos/home/niri/config/";
in
{
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000"; # 背景颜色设为黑色
      show-failed-attempts = true; # 显示失败次数
      ring-color = "ffff00"; # 锁定环的颜色
    };
  };

}
