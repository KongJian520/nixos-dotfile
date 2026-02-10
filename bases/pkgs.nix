{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    hashcat
    calc
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    nixfmt
    vim
    hyprland
    nil
    rkdeveloptool
    nix-index
    nix-tree
    ccze
    gh
  ];
}
