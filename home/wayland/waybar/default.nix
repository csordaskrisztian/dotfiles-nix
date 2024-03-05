{theme, ...}: {
  imports = [./style.nix];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 4;

        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
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
        };

        "hyprland/workspaces" = {
          on-click = "activate";
          format = "";
        };

        "tray" = {
          icon-size = 14;
          spacing = 5;
        };

        "clock" = {
          format = "{:%R}";
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
          format-wifi = "󰤨 {essid}";
          format-ethernet = "󱘖";
          tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-linked = "󱘖 {ifname} (No IP)";
          format-disconnected = " Disconnected";
          format-alt = "󰤨 {signalStrength}%";
          interval = 5;
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
          format = "󰁹{capacity}%";
        };
      };
    };
  };
}
