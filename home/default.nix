{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hyprland
    ./code
    ./obs
    ./niri
    # ./iamb
    ./kitty
    ./eww
    # ./ags
    ./mako
    ./alacritty
    ./neovim
    ./thunar
    ./nautilus
    ./pkgs.nix
    ./thunderbird
    # ./fcitx5
    ./quickshell
    ./xdg.nix
  ];
  home.username = "kongjian";
  home.homeDirectory = "/home/kongjian";

  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };

  # 直接以 text 的方式，在 nix 配置文件中硬编码文件内容
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  xresources.properties = {
    "Xcursor.size" = 32;
    "Xft.dpi" = 144;
  };

  # git 相关配置
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "2501491361@qq.com";
        name = "KongJianGhost";
      };
    };
  };
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO 在这里添加你的自定义 bashrc 内容
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # TODO 设置一些别名方便使用，你可以根据自己的需要进行增删
    shellAliases = {
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
