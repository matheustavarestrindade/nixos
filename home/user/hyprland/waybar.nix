# /etc/nixos/waybar.nix (or your preferred path)

{ pkgs, lib, config, ... }: # Added config for potential future use or checks

let
  # Define the mediaplayer script (remains unchanged)
  mediaplayerScript = pkgs.writeShellScriptBin "waybar-mediaplayer.sh" ''
    #!${pkgs.stdenv.shell}
    # Ensure playerctl is in PATH for the script's execution context
    PATH=${lib.makeBinPath [ pkgs.playerctl ]}:$PATH

    player_status=$(playerctl status 2> /dev/null)
    if [ "$player_status" = "Playing" ]; then
      echo "$(playerctl metadata artist) - $(playerctl metadata title)"
    elif [ "$player_status" = "Paused" ]; then
      echo " $(playerctl metadata artist) - $(playerctl metadata title)"
    fi
  '';
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;

        modules-left = [ "hyprland/workspaces" "custom/spotify" ];
        modules-center = [ "hyprland/window" ]; # Changed from sway/window
        modules-right = [ "pulseaudio" "network" "cpu" "memory" "battery" "tray" "clock" ];

        "hyprland/workspaces" = { # Changed from sway/workspaces
          disable-scroll = true;
          all-outputs = false;
          format = "{icon}";
          # You can also use {name} or {id}
           format-icons = { 
             "1" = "";
             "2" = ""; 
             "3" = "";
             "default" = "";
           };
        };

        "hyprland/window" = { # Changed from sway/window
          max-length = 50; # Adjust as needed
          # separate-outputs = false; # Set to true to only show window on its own output
        };

        tray = {
          spacing = 10;
        };

        clock = {
          format-alt = "{:%Y-%m-%d}";
        };

        cpu = {
          format = "{usage}% ";
        };

        memory = {
          format = "{}% ";
        };

        # Battery module configuration (already includes icons)
        # This module will appear if a battery is detected by Waybar.
        # The "if I'm on a laptop" condition is implicitly handled by Waybar's
        # ability to detect a battery. If no battery is found, the module usually hides.
        battery = {
          # Ensure 'BAT0' is correct for your system. Check with 'ls /sys/class/power_supply/'
          # Common alternatives: BAT1, bat0, etc.
          bat = "BAT1";
          adapter = "ACAD"; # Or AC, ACAD - check your /sys/class/power_supply/
          states = {
            warning = 30;
            critical = 15;
            # good = 80; # Optional: if you want a "good" state distinct from normal
          };
          # The {icon} placeholder will use the icons defined in format-icons
          format = "{capacity}% {icon}";
          format-charging = "{capacity}%  {icon}"; # Example: different icon when charging
          format-plugged = "{capacity}%  {icon}";  # Often same as charging
          format-alt = "{time} {icon}"; # Example: show time to empty/full on alt format
          # These icons correspond to different battery levels (e.g., empty, low, medium, high, full)
          # The exact percentage thresholds for these icons are usually Waybar defaults
          # or can sometimes be influenced by 'states'.
          format-icons = [ "" "" "" "" "" ];
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" ];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        "custom/spotify" = {
          format = " {}";
          max-length = 40;
          interval = 30;
          exec = "${mediaplayerScript}/bin/waybar-mediaplayer.sh";
          exec-if = "${pkgs.procps}/bin/pgrep spotify";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "Ubuntu Nerd Font", FontAwesome, Material Design Icons;
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: white;
      }

      #window { /* This is for the hyprland/window module now */
        font-weight: bold;
        font-family: "Ubuntu";
      }

      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: white;
        border-top: 2px solid transparent;
      }

      #workspaces button.active {
        color: #33ccff;
        border-top: 2px solid #33ccff;
      }

      /* #mode was removed, so its style is no longer needed unless reused */
      /* #mode {
        background: #64727D;
        border-bottom: 3px solid white;
        padding: 0 3px;
        margin: 0 2px;
      } */

      #clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray {
        padding: 0 3px;
        margin: 0 2px;
      }

      #clock {
        font-weight: bold;
      }

      #battery.warning:not(.charging) {
        color: white;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      /* You can add specific styles for .charging, .plugged, .critical if needed */
      /* #battery.critical:not(.charging) { background-color: red; } */

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: black;
        }
      }

      #network.disconnected {
        background: #f53c3c;
        color: white;
      }

      #custom-spotify {
        color: rgb(102, 220, 105);
      }

      #tray {
      }
    '';
  };
}
