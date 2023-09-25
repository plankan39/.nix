{config, pkgs, ...}: {
  wayland.windowManager.hyprland.extraConfig = ''
  
    input {
      kb_layout = se
    }
  '';


}
