{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestion = true;
    autocd = true;
  };


}
