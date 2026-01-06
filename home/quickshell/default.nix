{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  qsPath = "${config.home.homeDirectory}/.nixos/home/quickshell/config";
in
{
  xdg.configFile."quickshell".source = config.lib.file.mkOutOfStoreSymlink qsPath;
  home.packages = with pkgs; [
    quickshell
    kdePackages.qtimageformats
    kdePackages.qtsvg
    kdePackages.qtmultimedia
    kdePackages.qt5compat
  ];
  # xdg.configFile."quickshell/shell.qml".source = ./shell.qml;

}
