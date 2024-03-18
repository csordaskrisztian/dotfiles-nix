{theme, ...}: {
  imports = [./style.nix];

  programs.waybar = {
    enable = true;
    # systemd = {
    #   enable = true;
    #   target = "graphical-session.target";
    # };
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        height = 30;

        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "idle_inhibitor" 
          "custom/notification"
          "cpu"
          "memory"
          "network"
          "pulseaudio"
          "bluetooth"
          "battery"
        ];

        "custom/launcher" = {
          format = "󱄅";
          on-click = "wlogout";
        };

        "hyprland/workspaces" = {
          on-click = "activate";
          format = "";
          persistent-workspaces = {
            "DP-3" = 5;
            "HDMI-A-1" = [10];
          };
        };

        "tray" = {
          icon-size = 14;
          spacing = 5;
        };

        "clock" = {
          format = "{:%R - %a %d.}";
          tooltip-format = "{:%A, %B, %d, %Y}";
          tooltip = true;
        };

        "cpu" = {
          interval = 10;
          format = " {usage}%";
        };

        "memory" = {
          interval = 30;
          format = " {percentage}%";
          format-alt = " {used}GB";
          max-length = 10;
        };

        "network" = {
          format-wifi = "{icon}";
          format-ethernet = "󱘖";
          tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-linked = "󱘖 {ifname} (No IP)";
          format-disconnected = " Disconnected";
          format-alt = "󰤨 {signalStrength}%";
          interval = 5;
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        };

        "pulseaudio" = {
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-icons = {
            "default" = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "bluetooth" = {
          format = "";
          format-disabled = "";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = " {device_alias} 󰂄{device_battery_percentage}%";
          tooltip = true;
          on-click = "blueman";
          format-connected-battery = "{icon}󰂯";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        "battery" = {
          bat = "BAT0";
          interval = 60;
          format = "{icon}{capacity}%";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "group/grouptray" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = false;
          };
          modules = [
            "custom/tray"
            "tray"
          ];
        };
        "custom/tray" = {
          format = "";
          tooltip = false;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      };
    };
  };
}
