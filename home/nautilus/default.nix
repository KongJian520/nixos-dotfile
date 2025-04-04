{ pkgs, config, ... }:

{
  # 添加必要的包
  home.packages = with pkgs; [
    nautilus
    nautilus-open-any-terminal
    sushi
    code-nautilus
    turtle
  ];

}
