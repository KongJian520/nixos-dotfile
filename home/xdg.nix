{ config, pkgs, ... }:

{
  # 启用 Home Manager 对 XDG 属性的管理
  xdg.mimeApps = {
    enable = true;
    # 设置默认关联程序
    # 你可以通过运行 `grep "MimeType=" /run/current-system/sw/share/applications/*.desktop` 来查找程序的 desktop 文件名
    defaultApplications = {
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "image/*" = [ "imv.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "inode/directory" = [ "yazi.desktop" ]; # 默认文件管理器
    };

    # 强制关联（可选，会覆盖其他设置）
    associations.added = {
      "text/plain" = [ "nvim.desktop" ];
    };
  };
}
