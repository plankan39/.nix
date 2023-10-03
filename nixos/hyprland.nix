{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    # only for nvidia
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };
  programs.gnupg.agent = { enable = true; };

  environment.systemPackages = [
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    pkgs.mako
    pkgs.libnotify
    pkgs.wofi
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    #extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-gnome ];
  };

}
