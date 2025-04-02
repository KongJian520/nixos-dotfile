{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    jdk8
    jdk17
    jdk23
    maven
  ];
}
