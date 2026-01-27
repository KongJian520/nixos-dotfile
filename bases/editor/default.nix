{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./jdk.nix
    # ./rust.nix
  ];
    nixpkgs.overlays = [
    (import ./jetbrains-vmoptions.nix)
  ];

  environment.systemPackages = with pkgs; [
    direnv
    # python3Full
    uv
    jetbrains.clion
    jetbrains.idea
    jetbrains.pycharm
    jetbrains.webstorm
    jetbrains.rust-rover
    lua-language-server
    qt6.qtdeclarative
  ];

}
