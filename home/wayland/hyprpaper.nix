{pkgs,...}: {
  
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/Downloads/gruvbox-dark-blue.png
    wallpaper = ,~/Downloads/gruvbox-dark-blue.png
  '';

  # systemd.user.services.hyprpaper = {
  #   description = "Hyprland wallpaper daemon";
  #   ExecStart = ''${pkgs.hyprpaper}/bin/hyprpaper'';
  # };
}
