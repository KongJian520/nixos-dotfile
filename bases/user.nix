{ lib, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kongjian = {
    isNormalUser = true;
    shell=pkgs.zsh;
    description = "kongjian";
    extraGroups = [
      "audio"
      "video"
      "networkmanager"
      "wheel"
      "wireshark"
      "storage"
    ];
    packages = with pkgs; [ ];
  };
}
