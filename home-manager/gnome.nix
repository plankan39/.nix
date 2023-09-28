{ config, lib, pkgs, ... }:

let
  left = "h";
  down = "j";
  up = "k";
  right = "l";
in {
  dconf.settings = with lib.hm.gvariant; {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "pop-shell@system76.com"
        "native-window-placement@gnome-shell-extensions.gcampax.github.com" # works better with pop-shell
        "appindicatorsupport@rgcjonas.gmail.com"
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
    };

    "org/gnome/shell/extensions/pop-shell" = {
      tile-by-default = true;
      snap-to-grid = true;
      smart-gaps = true;
      show-title = false;
      active-hint = true;
      hint-color-rgba = "rgba(136, 192, 208, 0.7)";
    };

    # key bindings for pop-shell
    "org/gnome/mutter/wayland/keybindings" = { restore-shortcuts = [ ]; };
    "org/gnome/shell/keybindings" = {
      open-application-menu = [ ];
      toggle-message-tray = [ "<Super>v" ];
      toggle-overview = [ ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      minimize = [ "<Super>comma" ];
      maximize = [ ];
      unmaximize = [ ];
      toggle-maximized = [ "<Super>m" ];
      toggle-fullscreen = [ "<Super>f" ];
      toggle-on-all-workspaces = [ "<Super>p" ];

      switch-to-workspace-left =
        [ "<Primary><Super>Left" "<Primary><Super>${left}" ];
      switch-to-workspace-right =
        [ "<Primary><Super>Right" "<Primary><Super>${right}" ];
      switch-to-workspace-down = [ ];
      switch-to-workspace-up = [ ];

      move-to-workspace-left = [ "<Shift><Super>Left" "<Shift><Super>${left}" ];
      move-to-workspace-right =
        [ "<Shift><Super>Right" "<Shift><Super>${right}" ];
      move-to-workspace-down = [ ];
      move-to-workspace-up = [ ];

      move-to-monitor-left = [ "<Shift><Super>Up" "<Shift><Super>${up}" ];
      move-to-monitor-right = [ "<Shift><Super>Down" "<Shift><Super>${down}" ];
      move-to-monitor-up = [ ];
      move-to-monitor-down = [ ];
    };
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ ];
      toggle-tiled-right = [ ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      screensaver = [ "<Super>Escape" ];
      home = [ "<Super>f" ];
      email = [ "<Super>e" ];
      www = [ "<Super>b" ];
      terminal = [ "<Super>t" ];
      rotate-video-lock-static = [ ];
    };
  };
}

