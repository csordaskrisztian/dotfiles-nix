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
        spacing = 4;
        height = 30;

        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "idle_inhibitor"
          "tray"
          "cpu"
          "memory"
          "network"
          "bluetooth"
          "pulseaudio"
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
            "*" = 5;
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
            activated = "";
            deactivated = "";
          };
        };
      };
    };
  };
}
