{ config, pkgs, ... }:

{

  programs.rofi = {
    enable = true;
    pass.enable = true;
    theme =
      "/home/lukase/.nix/home-manager/rofi/rofi-themes-collection/themes/rounded-nord-dark.rasi";
    plugins = with pkgs; [ rofi-calc rofi-emoji rofi-bluetooth pinentry-rofi ];
  };

}
