{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    # extensions = with pkgs.vscode-extensions; [
    #   mkhl.direnv
    #   usernamehw.errorlens
    #   tamasfe.even-better-toml
    #   pinage404.nix-extension-pack
    #   ms-python.python
    #   ms-python.debugpy
    #   ms-python.vscode-pylance
    #   rust-lang.rust-analyzer
    # ];
  };

}
