{ lib, pkgs, ... }:
{
  fonts.fontDir.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts-cjk-serif
    wqy_zenhei # 添加文泉驿字体
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts

    nerd-fonts.fira-code
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.jetbrains-mono
    nerd-fonts.droid-sans-mono
  ];

  fonts.fontconfig = {
    enable = true;
    antialias = true;
    hinting.enable = true;
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ "FiraCode Nerd Font" ];
      sansSerif = [ "Noto Sans CJK SC" ];
      serif = [ "Noto Serif CJK SC" ];
    };
  };
}
