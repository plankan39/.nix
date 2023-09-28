{ config, pkgs, ... }:

{
  #environment.systemPackages = with pkgs;
  # with gnomeExtensions; [
  #  gnome.dconf-editor
  # gnome.gnome-tweaks
  #native-window-placement
  #appindicator
  #pop-shell
  #gnome-bedtime
  #];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  #  services.xserver.desktopManager.gnome.enable = true;
  programs.xwayland.enable = true;

  # exclude some default applications
  #  environment.gnome.excludePackages = with pkgs; [
  #   gnome.gnome-weather
  #  gnome.gnome-calendar
  # gnome.gnome-maps
  #gnome.gnome-contacts
  # gnome.gnome-software
  #gnome.totem
  # gnome.epiphany
  # gnome.evince
  #];
  #programs.gnome-terminal.enable = false;
  #programs.geary.enable = false;
}

