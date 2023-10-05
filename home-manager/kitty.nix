{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Macchiato";
    settings = {
      hide_window_decorations = "yes";
      background_opacity = "0.8";
      enable_audio_bell = "no";
    };
  };

}
