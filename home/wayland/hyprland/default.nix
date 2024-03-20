{
  inputs,
  pkgs,
  theme,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      "$mod" = "SUPER";

      # monitor = [",preferred,auto,auto"];
      monitor = [
        "HDMI-A-1, 1920x1080@60, 0x0, 1"
        "DP-3, 1920x1080@144, 1920x0, 1"
      ];

      workspace = [
        "DP-3,1"
        "HDMI-A-1,10"
      ];

      xwayland.force_zero_scaling = true;

      exec-once = [
        # "hyprpaper"
        "swww init"
        "hyprlock"
        "swaync"
        "waybar"
      ];

      env = [
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      input = {
        kb_layout = "hu";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        accel_profile = "flat";
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          drag_lock = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "0xff${theme.colors.color4}";
        "col.inactive_border" = "0xff${theme.colors.background}";
        layout = "dwindle";
        resize_on_border = true;
        allow_tearing = true;
      };

      decoration = {
        rounding = 12;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          ignore_opacity = true;
          new_optimizations = true;
          xray = false;
          noise = "0.05";
        };
        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_range = 6;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
        layerrule = ["ignorezero waybar"];
        blurls = ["waybar" "popups" "lockscreen" "logout_dialog"];
      };

      animation = {
        bezier = [
        "fluent_decel, 0, 0.2, 0.4, 1"
        "easeOutCirc, 0, 0.55, 0.45, 1"
        "easeOutCubic, 0.33, 1, 0.68, 1"
        "easeinoutsine, 0.37, 0, 0.63, 1"
        ];
        animation = [
          "windowsIn, 1, 1.7, easeOutCubic, slide" # window open
          "windowsOut, 1, 1.7, easeOutCubic, slide" # window close
          "windowsMove, 1, 2.5, easeinoutsine, slide" # everything in between, moving, dragging, resizing

          # fading
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 3, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 1, 5, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 5, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 6, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "workspaces, 1, 2, fluent_decel, slide" # styles: slide, slidevert, fade, slidefade, slidefadevert
          "specialWorkspace, 1, 3, fluent_decel, slidevert"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        # force_split = 2;
      };

      master = {
        new_is_master = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_autoreload = true;
        no_direct_scanout = false;
        vrr = 1;
      };

      windowrulev2 = [
        # "nomaximizerequest, class:.*"
        "float,class:^(pavucontrol)$"
        "float,class:^(blueman-manager)$"
        "float,title:^(Picture-in-Picture)$"
        "float,class:^(dialog)$"
        "float,class:^(error)$"
        "float,title:^(Open File)$"

        "keepaspectratio,title:^(Picture-in-Picture)$"
        "fakefullscreen,title:^(Picture-in-Picture)$"
        "pin,title:^(Picture-in-Picture)$"
        "noborder,onworkspace:1"
      ];

      bind = [
        "$mod, Return, exec, alacritty"
        "$mod SHIFT, Return, exec, [floating] alacritty"
        "$mod, Q, killactive"
        "$mod, delete, exit"
        "$mod, Space, togglefloating"
        "$mod, D, exec, pkill .anyrun-wrapped || anyrun"
        "$mod, F, exec, librewolf"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        "Control, Escape, exec, killall .waybar-wrapped || waybar"
        "$mod, S, togglespecialworkspace"
        "$mod Shift, S, movetoworkspace, special"
        "$mod, C, exec, hyprctl dispatch centerWindow"
        "$mod, T, fullscreen"
        ", Print, exec, grim -o DP-3"
        "$MODSHIFT, O, exec, grim -g \"$(slurp)\""

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod Shift, left, movewindow, l"
        "$mod Shift, right, movewindow, r"
        "$mod Shift, up, movewindow, u"
        "$mod Shift, down, movewindow, d"

        "$mod Shift, Space, workspaceopt, allfloat"
        "$mod Shift, P, workspaceopt, allpseudotile"
        "$mod, Escape, exec, wlogout -p layer-shell"
        "$mod, Tab, cyclenext"
        "$mod, Tab, bringactivetotop"
        "Control Alt, L, exec, loginctl lock-session"
        "$mod, +, exec, hyprctl keyword general:gaps_out 20"
        "$mod, -, exec, hyprctl keyword general:gaps_in 5"

        "${builtins.concatStringsSep "\n" (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in ''
              bind = $mod, ${ws}, workspace, ${toString (x + 1)}
              bind = $mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
            ''
          )
          10)}"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      binde = [
        "$mod Control, left, resizeactive, -30 0"
        "$mod Control, right, resizeactive, 30 0"
        "$mod Control, up, resizeactive, 0 -30"
        "$mod Control, down, resizeactive, 0 30"
      ];
    };
  };
}
  
