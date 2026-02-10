{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (flameshot.override { enableWlrSupport = true; })
    direnv
    imhex
    gimp
    obsidian
    todesk
    picocom
    kdePackages.ark
    freerdp
    zed
    # ventoy-bin-full
    telegram-desktop
    remmina
    thunderbird
    ags
    qbittorrent
    wpsoffice-cn
    qq
    wemeet
    wechat-uos
    yazi
    bat
    gedit
    firefox
    google-chrome
    slurp
    grim
    wl-clipboard
    chromium
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
    netcat-openbsd # needed for SSH ProxyCommand to mihomo

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
    remmina
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

}
