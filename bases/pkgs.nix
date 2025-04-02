{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    hashcat
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    nixfmt-rfc-style
    vim
    hyprland
    nil
    rkdeveloptool
    nix-index
    nix-tree

    ccze

  ];
}
