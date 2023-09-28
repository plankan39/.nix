{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Nord";
    settings = {
      hide_window_decorations = "yes";
      background_opacity = "0.8";
    };
  };

}
