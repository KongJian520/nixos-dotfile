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
    ./iamb
    ./kitty
    ./eww
    ./mako
    ./alacritty
    ./nixvim
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
    "Xcursor.size" = 24;
    "Xft.dpi" = 144;
  };

  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装

  home.packages = with pkgs; [
    (flameshot.override { enableWlrSupport = true; })

    ventoy-bin-full

    qbittorrent
    wpsoffice-cn
    qq
    wechat-uos
    yazi
    gedit
    firefox
    google-chrome
    #chromium
    #   # 如下是我常用的一些命令行工具，你可以根据自己的需要进行增删
    fastfetch
    #   nnn # terminal file manager
    #   # archives
    zip
    xz
    unzip
    p7zip
    #   # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    #   yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    #   # networking tools
    #   mtr # A network diagnostic tool
    #   iperf3
    #   dnsutils  # `dig` + `nslookup`
    #   ldns # replacement of `dig`, it provide the command `drill`
    #   aria2 # A lightweight multi-protocol & multi-source command-line download utility
    #   socat # replacement of openbsd-netcat

    #   ipcalc  # it is a calculator for the IPv4/v6 addresses

    #   # misc
    #   cowsay
    file
    which
    tree
    #   gnused
    #   gnutar
    #   gawk
    zstd
    #   gnupg

    #   # nix related
    #   #
    #   # it provides the command `nom` works just like `nix`
    #   # with more details log output
    nix-output-monitor

    #   # productivity
    #   hugo # static site generator
    glow # markdown previewer in terminal

    btop # replacement of htop/nmon
    #   iotop # io monitoring
    #   iftop # network monitoring

    #   # system call monitoring
    #   strace # system call monitoring
    #   ltrace # library call monitoring
    lsof # list open files

    #   # system tools
    #   sysstat
    #   lm_sensors # for `sensors` command
    #   ethtool
    #   pciutils # lspci
    #   usbutils # lsusb
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "KongJianGhost";
    userEmail = "2501491361@qq.com";
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
