{ lib, pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk # alternatively, kdePackages.fcitx5-qt
      fcitx5-chinese-addons # table input method support
      fcitx5-nord # a color theme
      rime-data
      fcitx5-rime
    ];
    fcitx5.themes = {
      # 为 nord 主题定义一个配置
      nord = {
        # theme 选项指定主题的配置文件内容
        theme = builtins.readFile "${pkgs.fcitx5-nord}/share/fcitx5/themes/Nord-Dark/theme.conf";
      };
    };
  };
}
