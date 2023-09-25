{ config, pkgs, ... }:

{
  programs.rbw = {
    enable = true;
    settings = {
      email = "lukas.elmlund@gmail.com"
    };
  };

}
