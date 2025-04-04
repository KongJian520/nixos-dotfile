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
    hypridle
    dconf
    xdg-desktop-portal-hyprland
    wayland
    fuzzel
    swww
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
    plugins = [

    ];
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    hyprcursor = {
      size = 32;
      enable = true;
    };
  };
  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  programs.hyprlock = {
    enable = true;
  };
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;

}
