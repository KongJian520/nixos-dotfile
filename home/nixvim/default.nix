{ nixvim, ... }: # 简化参数声明
{
  imports = [ nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true; # 修正拼写错误
  };
}
