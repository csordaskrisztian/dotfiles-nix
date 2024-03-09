{theme, ...}: {
  # imports = [
  #   inputs.hyprlock.homeManagerModules.hyprlock
  # ];
  programs.hyprlock = {
    enable = true;

    general = {
      hide_cursor = true;
      disable_loading_bar = false;
    };

    backgrounds = [
      {
        path = "${theme.wallpaper}";
        blur_size = 4;
        blur_passes = 3;
        noise = 0.03;
        vibrancy = 0.27;
      }
    ];

    input-fields = [
      {
        size = {
          width = 300;
          height = 50;
        };
        outline_thickness = 2;
        inner_color = "rgb(22,22,22)";
        font_color = "rgb(218,218,218)";
        fade_on_empty = true;
        dots_size = 0.33;
        dots_spacing = 0.2;
        dots_center = true;
        hide_input = false;
        halign = "center";
        valign = "center";
        placeholder_text = "<i>Password...</i>";
      }
    ];

    labels = [
      {
        text = "$TIME";
        color = "rgb(200,200,200)";
        font_size = 64;
        font_family = "JetBrainsMono Nerd Font";
        position = {
          x = 0;
          y = -200;
        };
        valign = "top";
        halign = "center";
      }
    ];
  };
}
