# configuration.nix

{ config, pkgs, ... }:

{
  # ... 其他配置 ...

  # 为nix包管理器配置代理
  nix = {
    # 启用nix守护进程（如果尚未启用）
    daemonTrustedUsers = [ "root" "kongjian" ]; # 将your_user_name替换为你的用户名
    
    # 使用extraOptions来设置Nix的特定选项
    extraOptions = ''
      # 代理设置
      http-proxy = http://192.168.31.150:10810/
      https-proxy = http://192.168.31.150:10810/
      no-proxy = localhost,127.0.0.1
    '';
  };
  
  # ... 其他配置 ...
}