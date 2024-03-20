{
  inputs,
  pkgs,
  theme,
  ...
}: {
  imports = [
    inputs.ironbar.homeManagerModules.default
  ];
  programs.ironbar = {
    enable = true;
    config = {
      anchor_to_edges = true;
      position = "top";
      height = 30;
      icon_theme = "Qogir";
      popup_gap = 10;
      start = [
        {
          type = "label";
          label = "󱄅";
          name = "nix";
        }
        {
          type = "workspaces";
          name = "ws";
          all_monitors = false;
          favorites = {
            "DP-3" = [
              "1"
              "2"
              "3"
              "4"
              "5"
            ];
            "HDMI-A-1" = [
              "10"
            ];
          };
        }
        {
          type = "music";
          player_type = "mpris";
          truncate = {
            mode = "end";
            max_length = 100;
          };
        }
      ];

      center = [
        {
          type = "clock";
          format = "%R - %a %d.";
        }
      ];

      end = [
        {
          type = "tray";
          direction = "left_to_right";
        }
        {
          type = "sys_info";
          interval = {
            memory = 30;
            cpu = 5;
          };
          format = [
            " {cpu_percent}%"
            " {memory_percent}%"
          ];
        }
        {
          type = "notifications";
          show_count = true;
          icons = {
            closed_none = "󰍥";
            closed_some = "󱥂";
            closed_dnd = "󱅯";
            open_none = "󰍡";
            open_some = "󱥁";
            open_dnd = "󱅮";
          };
        }
        {
          type = "volume";
          format = "{icon}";
          max_volume = 100;
          icons = {
            volume_high = "󰕾";
            volume_medium = "󰖀";
            volume_low = "󰕿";
            muted = "󰝟";
          };
        }
        {
          type = "custom";
          name = "power-menu";
          bar = [
            {
              on_click = "!wlogout";
              label = "";
              name = "power-btn";
              type = "button";
            }
          ];
        }
      ];
    };
  };
}
