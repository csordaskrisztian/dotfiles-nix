{
  theme,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.9;
        padding = {
          x = 12;
          y = 12;
        };
        decorations = "Full";
        startup_mode = "Windowed";
      };

      font = {
        size = 11;
        # normal = {
        #   family = "Mononoki Nerd Font";
        #   style = "Regular";
        # };
      };

      colors = {
        primary = {
          background = "#${theme.colors.background}";
          foreground = "#${theme.colors.foreground}";
        };
        normal = {
          black = "#${theme.colors.color0}";
          red = "#${theme.colors.color1}";
          green = "#${theme.colors.color2}";
          yellow = "#${theme.colors.color3}";
          blue = "#${theme.colors.color4}";
          magenta = "#${theme.colors.color5}";
          cyan = "#${theme.colors.color6}";
          white = "#${theme.colors.color7}";
        };
        bright = {
          black = "#${theme.colors.color8}";
          red = "#${theme.colors.color9}";
          green = "#${theme.colors.color10}";
          yellow = "#${theme.colors.color11}";
          blue = "#${theme.colors.color12}";
          magenta = "#${theme.colors.color13}";
          cyan = "#${theme.colors.color14}";
          white = "#${theme.colors.color15}";
        };
        cursor = {
          text = "#${theme.colors.background}";
          cursor = "#${theme.colors.foreground}";
        };
      };
    };
  };
}
