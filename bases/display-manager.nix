{
  pkgs,
  config,
  services,
  ...
}:
{
  # services.greetd = {
  #   enable = true;
  #   settings = rec {
  #     sessions = {
  #       niri = {
  #         command = "${pkgs.niri}/bin/niri"; # 或改為 "${pkgs.niri}/bin/niri" 若有對應套件
  #         user = "kongjian";
  #       };
  #       hyprland = {
  #         command = "${pkgs.hyprland}/bin/hyprland";
  #         user = "kongjian";
  #       };
  #     };
  #     initial_session = sessions.hyprland;
  #     default_session = sessions.hyprland;
  #   };
  # };
  services.displayManager = {
    ly = {
      enable = true;
      settings = {
        numlock = true;
        #     none,
        #     doom,
        #     matrix,
        #     colormix,
        #     gameoflife,
        #     dur_file,
        animation = "gameoflife";

      };
    };
  };
}
