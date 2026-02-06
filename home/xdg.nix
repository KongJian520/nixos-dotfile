{ config, pkgs, ... }:

{
  # 确保必要的软件包已安装
  home.packages = with pkgs; [
    vscode
    nautilus # GNOME 文件管理器
    firefox # 用于打开 PDF
    kdePackages.ark # KDE 压缩管理器
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # 1. 文本文件使用 VS Code
      "text/plain" = [ "code.desktop" ];
      "text/markdown" = [ "code.desktop" ];
      "text/x-c" = [ "code.desktop" ];
      "text/x-c++" = [ "code.desktop" ];
      "application/x-shellscript" = [ "code.desktop" ];

      # 2. 文件管理使用 GNOME Nautilus
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];

      # 3. PDF 使用浏览器打开
      "application/pdf" = [ "firefox.desktop" ];

      # 4. 压缩包使用 Ark
      # 根据 KDE 规范，Ark 的桌面文件名为 org.kde.ark.desktop
      "application/zip" = [ "org.kde.ark.desktop" ];
      "application/vnd.rar" = [ "org.kde.ark.desktop" ];
      "application/x-7z-compressed" = [ "org.kde.ark.desktop" ];
      "application/x-tar" = [ "org.kde.ark.desktop" ];
      "application/x-bzip2" = [ "org.kde.ark.desktop" ];
      "application/x-gzip" = [ "org.kde.ark.desktop" ];
      "application/x-rar" = [ "org.kde.ark.desktop" ];

      # 网页链接
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };

    # 强制覆盖设置
    associations.added = {
      "application/zip" = [ "org.kde.ark.desktop" ];
      "text/plain" = [ "code.desktop" ];
    };
  };
}
