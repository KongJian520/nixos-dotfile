# ~/.config/nixpkgs/overlays/jetbrains-vmoptions.nix 或
# ./overlays/default.nix
self: super: {
  jetbrains = super.jetbrains // {
    clion = super.jetbrains.clion.override {
      vmopts = ''
        -Dawt.toolkit.name=WLToolkit
      '';
    };
    idea-ultimate = super.jetbrains.idea-ultimate.override {
      vmopts = ''
        -Dawt.toolkit.name=WLToolkit
      '';
    };
    pycharm-professional = super.jetbrains.pycharm-professional.override {
      vmopts = ''
        -Dawt.toolkit.name=WLToolkit
      '';
    };
    webstorm = super.jetbrains.webstorm.override {
      vmopts = ''
        -Dawt.toolkit.name=WLToolkit
      '';
    };
    rust-rover = super.jetbrains.rust-rover.override {
      vmopts = ''
        -Dawt.toolkit.name=WLToolkit
      '';
    };
  };
}