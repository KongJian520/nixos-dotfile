{
  config,
  pkgs,
  inputs,
  ...
}:
{
  services.displayManager = {
    ly = {
      enable = true;
      settings = {
        numlock = true;
      };
    };
  };
}
