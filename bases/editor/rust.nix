{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    rustup
  ];
}
