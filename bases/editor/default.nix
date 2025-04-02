{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ ./jdk.nix ];
  environment.systemPackages = with pkgs; [
    python3Full
    uv
    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.webstorm
    jetbrains.rust-rover
  ];

}
