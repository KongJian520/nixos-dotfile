{ pkgs, ... }: # 简化参数声明
{
  home.packages = with pkgs; [
    nautilus
    nautilus-open-any-terminal
    sushi
    code-nautilus
    turtle
  ];
}
