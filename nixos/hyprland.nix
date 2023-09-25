{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    # only for nvidia
    nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.systemPackages = [
    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    pkgs.mako
    pkgs.libnotify
  ];

}
