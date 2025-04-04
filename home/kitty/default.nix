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
      confirm_os_window_close = 0;
      term = "xterm-256color";
    };
  };
}
