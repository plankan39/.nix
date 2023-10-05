{ pkgs, ... }:

{

  services.network-manager-applet.enable = true;

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-left = 10;
        margin-right = 10;
        margin-top = 5;

        # Choose the order of the modules
        modules-left = [ "custom/power" "custom/media" "clock" "cpu" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "network" "backlight" "pulseaudio" "battery" "tray" ];

        # Modules configuration
        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
          persistent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
            "7" = [ ];
            "8" = [ ];
            "9" = [ ];
          };
        };

        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = "{name} {icon}";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };

        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };

        "clock" = {
          "tooltip-format" = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          "format-alt" = "{:%Y-%m-%d}";
        };

        "temperature" = {
          # // "thermal-zone"= 2 
          #// "hwmon-path"= "/sys/class/hwmon/hwmon2/temp1_input" 
          "critical-threshold" = 80;
          #// "format-critical"= "{temperatureC}°C {icon}" 
          "format" = "{temperatureC}°C {icon}";
          "format-icons" = [ "" "" "" ];
        };

        "cpu" = {
          "interval" = 5;
          "format" = "{usage}% ";
          "tooltip" = false;
        };

        "backlight" = {
          #// "device"= "acpi_video1";
          "format" = "{percent}% {icon}";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
        };

        "battery" = {
          "states" = {
            #// "good"= 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% ";
          "format-plugged" = "{capacity}% ";
          "format-alt" = "{time} {icon}";
          #// "format-good"= ""; // An empty format will hide the module
          #// "format-full"= "";
          "format-icons" = [ "" "" "" "" "" ];
        };

        "battery#bat2" = { "bat" = "BAT2"; };

        "network" = {
          #// "interface"= "wlp2*"; // (Optional) To force the use of this interface
          "format-wifi" = ""; # //({essid} {signalStrength}%)
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          #// "scroll-step"= 1  // %  can be a float
          "format" = "{volume}% {icon}"; # //{format_source}"
          "format-bluetooth" = "{volume}% {icon} 󰂯"; # //{format_source}"
          "format-bluetooth-muted" = "󰖁 {icon} 󰂯"; # //{format_source}"
          "format-muted" = "󰖁 {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "󰋋";
            "hands-free" = "󱡒";
            "headset" = "󰋎";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          "on-click" = "pavucontrol";
        };
      };
    };
    style = ''

      * {
          /* `otf-font-awesome` is required to be installed for icons */
          border: #333333;
          border-radius: 10px;
          /* border-radius: 50%; */
          font-family:  "Hack Nerd Font", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
          font-size: 16px;
          /* background-color: #2B3031; */
          background-color: rgba(43, 48, 59, .0);
         }

      window#waybar {
          /* border-bottom: 3px solid rgba(100, 114, 125, 0.5); */
          color: #FFFFFF;
          transition-property: background-color;
          transition-duration: .5s;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      /*
      window#waybar.empty {
          background-color: transparent;
      }
      window#waybar.solo {
          background-color: #FFFFFF;
      }
      */

      window#waybar.termite {
          background-color: #3F3F3F;
      }

      window#waybar.firefox {
          background-color: #000000;
          border: none;
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
          background: inherit;
          box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button {
          padding: 0 0.3em;
          background-color: transparent;
          color: #ffffff;
      }

      #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.focused {
          background-color: #64727D;
          box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button.urgent {
          /* background-color: #BBCCDD; */
          border-radius: 50%;
      }

      #window,
      #workspaces {
          margin: 0 4px;
      }

      #workspaces,
      #workspaces button,
      #workspaces button:hover,
      #workspaces button.focused,
      #workspaces button.urgent {
          padding-right: 0px;
          padding: 0px 6px;
          padding-left: 2px;
      }

      #mode {
          background-color: #64727D;
          border-bottom: 3px solid #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #custom-power,
      #mpd {
          padding: 0px 9px;
          padding-right: 13px;
          margin: 3px 3px;
          color: #333333;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
          background-color: #BBCCDD;
      }

      #battery {
          background-color: #BBCCDD;
          color: #333333;
      }

      #battery.charging, #battery.plugged {
          color: #ffffff;
          background-color: #26A65B;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }

      #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      label:focus {
          background-color: #000000;
      }

      #cpu {
          background-color: #BBCCDD;
          color: #000000;
      }

      #memory {
          background-color: #BBCCDD;
      }

      #disk {
          background-color: #BBCCDD;
      }

      #backlight {
          background-color: #BBCCDD;
      }

      #network {
          background-color: #BBCCDD;
      }

      #network.disconnected {
          background-color: #f53c3c;
      }

      #pulseaudio {
          background-color: #BBCCDD;
      }

      #pulseaudio.muted {
          background-color: #BBCCDD;
      }

      #wireplumber {
          background-color: #BBCCDD;
      }

      #wireplumber.muted {
          background-color: #f53c3c;
      }

      #custom-media {
          background-color: #66cc99;
          color: #2a5c45;
          min-width: 100px;
      }

      #custom-media.custom-spotify {
          background-color: #66cc99;
      }

      #custom-media.custom-vlc {
          background-color: #ffa000;
      }

      #temperature {
          background-color: #BBCCDD;
      }

      #temperature.critical {
          background-color: #eb4d4b;
      }
      #tray menu,
      #tray {
          color: #BBCCDD;
          background-color: #333333;
      }
      #custom-power {
        background-color: #BBCCDD;
        padding-right: 13px;
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }

      #idle_inhibitor {
          background-color: #BBCCDD;
      }

      #idle_inhibitor.activated {
          background-color: #ecf0f1;
          color: #2d3436;
      }

      #mpd {
          background-color: #BBCCDD;
      }

      #mpd.disconnected {
          background-color: #f53c3c;
      }

      #mpd.stopped {
          background-color: #90b1b1;
      }

      #mpd.paused {
          background-color: #51a37a;
      }

      #language {
          background: #BBCCDD;
          color: #333333;
          padding: 0 5px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state {
          background: #BBCCDD;
          color: #333333;
          padding: 0 0px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state > label {
          padding: 0 5px;
      }

      #keyboard-state > label.locked {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad.empty {
        background-color: transparent;
      }
    '';
  };
}
