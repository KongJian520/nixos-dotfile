{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pulseaudio
    pavucontrol
  ];

  services.pulseaudio.enable = true;
  services.pipewire.enable = false;

}
