{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/hyprland";
        user = "kongjian";
      };
      default_session = initial_session;
    };
  };
  # services.displayManager = {
  #   ly = {
  #     enable = true;
  #     settings = {
  #       numlock = true;
  #       animation = "colormix";
  #     };
  #   };
  # };
}
