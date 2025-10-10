{ lib, pkgs, ... }:
let
  P620 = builtins.readFile ./ssh/P620.pub; # 相对路径：相对于 configuration.nix 所在目录
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kongjian = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "kongjian";
    openssh.authorizedKeys.keys = [
      P620
    ];
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
  security.sudo.wheelNeedsPassword = false;
}
