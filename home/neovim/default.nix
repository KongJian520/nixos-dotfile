{ config, pkgs, ... }:

let
  nvimPath = "${config.home.homeDirectory}/home/neovim/config";
in
{
  # 安装 neovim 可执行文件到用户环境
  home.packages = with pkgs; [ neovim ];

  # 启用 programs.neovim 并做一些基础设置
  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    viAlias = true;
    vimAlias = true;
  };

  # 把 ~/.config/nvim 指向你仓库里的 nvim 配置目录以加速调试
  xdg.configDir."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;
}