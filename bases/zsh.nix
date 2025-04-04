{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "robbyrussell";
    };
    
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch -L |& nom";
    };
    # history.size = 10000;
  };
}
