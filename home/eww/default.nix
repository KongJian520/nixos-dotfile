{
  config,
  pkgs,
  inputs,
  ...
}:
{

   home.packages = with pkgs; [
    brightnessctl
    inotify-tools
    libnotify
    socat
   ];
  programs.eww = {
    enable = true;
    enableZshIntegration = true;
    configDir = ./eww;
  };
}
