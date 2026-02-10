{
  pkgs,
  config,
  services,
  ...
}:
{
  programs.niri.enable = true;
  services.greetd = {
    enable = true;
    settings = rec {
      sessions = {
        niri = {
          command = "${pkgs.niri}/bin/niri-session"; # 或改為 "${pkgs.niri}/bin/niri" 若有對應套件
          user = "kongjian";
        };
        hyprland = {
          command = "${pkgs.hyprland}/bin/hyprland";
          user = "kongjian";
        };
      };
      initial_session = sessions.niri;
      default_session = sessions.niri;
    };
  };
  # services.displayManager = {
  #   ly = {
  #     enable = true;
  #     settings = {
  #       numlock = true;
  #       #     none,
  #       #     doom,
  #       #     matrix,
  #       #     colormix,
  #       #     gameoflife,
  #       #     dur_file,
  #       animation = "gameoflife";

  #     };
  #   };
  # };
}
