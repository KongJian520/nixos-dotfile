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

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        # 使用你确认的 7890 mixed 端口，走 SOCKS5 协议 (-X 5)
        proxyCommand = "${pkgs.netcat}/bin/nc -X 5 -x 127.0.0.1:7890 %h %p";
      };
      "*" = {
        # 1. 保持长连接 (防止因一段时间没操作被服务器踢掉)
        # 每 60 秒发一个心跳包，如果连续 3 次没回应才断开
        extraOptions = {
          ServerAliveInterval = "60";
          ServerAliveCountMax = "3";

          # 2. 自动接受新的主机指纹 (慎用，但对于经常重装系统的内网机器很方便)
          # StrictHostKeyChecking = "ask";

          # 3. 压缩传输 (在网络环境较差时加速，但在高速内网反而会浪费 CPU)
          Compression = "yes";

          # 4. 解决 SSH 连接缓慢的问题
          # 禁用 GSSAPI 认证，很多服务器不支持它，开启会导致握手时卡顿数秒
          GSSAPIAuthentication = "no";
        };

        # 5. 自动复用连接 (极大加快同一个服务器的第二次连接速度)
        # 它会创建一个 socket 文件，后续连接直接复用第一个通道，无需重复握手
        controlMaster = "auto";
        controlPath = "~/.ssh/master-%r@%h:%p";
        controlPersist = "10m"; # 即使主连接关了，通道也保持 10 分钟
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
