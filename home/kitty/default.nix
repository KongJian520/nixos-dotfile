{
  config,
  pkgs,
  inputs,
  ...
}:
{

  programs.kitty = {
    shellIntegration.enableZshIntegration = true;
    enable = true;
    themeFile = "Monokai";
    font = {
      name = "UbuntuMono Nerd Font Mono";
      size = 15;
    };
    settings = {
      shell = ".";
      background_opacity = 0.7;
    };
  };
}
