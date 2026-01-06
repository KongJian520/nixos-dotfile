{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
  ];
  # xdg.configFile."quickshell/shell.qml".source = ./shell.qml;

}
