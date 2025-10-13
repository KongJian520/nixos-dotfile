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
    python3Full
    uv
    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.webstorm
    jetbrains.rust-rover
  ];

}
