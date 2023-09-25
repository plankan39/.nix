{ config, pkgs, ... }:

{
  programs.rbw = {
    enable = true;
    settings = {
      email = "lukas.elmlund@gmail.com";
    };
  };


home.packages = with.pkgs; [
  rofi-rbw
  wtype
];





}
