{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland
    ./waybar
    ./hyprpaper.nix
    ./wlogout.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./ironbar
    inputs.hyprlock.homeManagerModules.default
    inputs.hypridle.homeManagerModules.default
    inputs.ironbar.homeManagerModules.default
  ];

  home = {
    packages = with pkgs; [
      wl-clipboard
      hyprpaper
      wofi
      swww
      swaynotificationcenter
    ];

    sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
