{
  inputs,
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    # package = inputs.self.packages.${pkgs.system}.wezterm;
    extraConfig =
      /*
      lua
      */
      ''
        local wezterm = require ("wezterm")



        return {

          colors = {
            background = "#161616"
          },

          font = wezterm.font "Maple Mono SC NF",
          font_size = 11,

          color_scheme = "Tokyo Night Moon",
          window_background_opacity = 1.0,
          warn_about_missing_glyphs = false,
          enable_scroll_bar = false,
          enable_tab_bar = false,
          scrollback_lines = 10000,
          window_padding = {
            left = 15,
            right = 15,
            top = 15,
            bottom = 15,
          },
          enable_wayland = false,
          check_for_updates = false,
          default_cursor_style = "SteadyBar",
          automatically_reload_config = true,

          disable_default_key_bindings = true,
          keys = {
            {
              key = "v",
              mods = "CTRL|SHIFT",
              action = wezterm.action({ PasteFrom = "Clipboard" }),
            },
            {
              key = "c",
              mods = "CTRL|SHIFT",
              action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
            },
            },
              window_close_confirmation = "NeverPrompt",
            }
      '';
  };
}
