{
  pkgs,
  theme,
  ...
}: {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${theme.wallpaper}
    wallpaper = ,${theme.wallpaper}
  '';

  # systemd.user.services.hyprpaper = {
  #   description = "Hyprland wallpaper daemon";
  #   ExecStart = ''${pkgs.hyprpaper}/bin/hyprpaper'';
  # };
}
