{ config, pkgs, ... }:

{


  programs.starship = {
    enable = true;
    settings = {

    };
  };


  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };

  };



}
