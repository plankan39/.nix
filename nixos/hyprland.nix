{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    # only for nvidia
    nvidiaPatches = true;
    xwayland.enable = true;
  };
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  environment.systemPackages = [
    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    pkgs.mako
    pkgs.libnotify
    pkgs.wofi
  ];
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


}
