{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    # hyprls
    # gwenview
    hyprlock
    dconf
    xdg-desktop-portal-hyprland
    wayland
    fuzzel
    swww
    xfce.thunar
    xfce.thunar-archive-plugin


  ];
  home.file.".config/hypr/" = {
    source = ./.config/hypr;
    recursive = true; # 递归整个文件夹
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    extraConfig = ''
      source = ./default.conf
    '';
  };

  programs.hyprlock = {
    enable = true;
  };
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;

}
