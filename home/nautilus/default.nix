{ pkgs, ... }: # 简化参数声明
{
  home.packages = with pkgs.xfce; [
    thunar
    thunar-archive-plugin
    thunar-vcs-plugin
    thunar-volman
    thunar-media-tags-plugin
  ];
}
