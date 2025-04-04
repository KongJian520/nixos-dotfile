{ lib, pkgs, ... }:
{
  imports = [
    ./hacker
    ./games
    ./editor
    ./virtualisation

    ./display-manager.nix
    ./bluetooth.nix
    ./configuration.nix
    ./nvidia.nix
    ./audio.nix
    ./user.nix
    ./plymouth.nix
    ./fonts.nix
    ./pkgs.nix
    ./proxy
    ./fcitx5.nix
    ./udisks.nix
    ./wine.nix
    ./zsh.nix
  ];
}
