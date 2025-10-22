{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.file.".config/alacritty/alacritty.toml".source = ./alacritty.toml;
  programs.alacritty.enable = true;
}
