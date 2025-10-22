{ config, pkgs, ... }:
let
  nvimPath = "${config.home.homeDirectory}/.nixos/home/neovim/.config";
in
{
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

}
