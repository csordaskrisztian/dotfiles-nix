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
    # ./ironbar
    inputs.hyprlock.homeManagerModules.default
    inputs.hypridle.homeManagerModules.default
  ];

  home = {
    packages = with pkgs; [
      wl-clipboard
      hyprpaper
      wofi
      swww
      swaynotificationcenter

      grim
      slurp
    ];
  };
}
