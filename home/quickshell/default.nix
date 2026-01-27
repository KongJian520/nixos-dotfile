{
  pkgs,
  lib,
  config,
  quickshell,
  ...
}:
let
  qsPath = "${config.home.homeDirectory}/.nixos/home/quickshell/config";

  quickshellPackage = quickshell.packages.${pkgs.system}.default;
in
{
  # 配置文件的软链接，指向本地配置目录
  xdg.configFile."quickshell".source = config.lib.file.mkOutOfStoreSymlink qsPath;

  home.packages = [
    # 使用 with 关键字从 pkgs.kdePackages 中提取所需的 Qt 模块
    # 这可以简化列表，避免重复书写前缀
    (quickshellPackage.withModules (
      with pkgs.kdePackages;
      [
        qt5compat 
        qtsvg
        qtimageformats 
        qtmultimedia
      ]
    ))
  ];
}
