{ inputs,pkgs,...}: {

  imports = [
    ./hyprland
    ./waybar
    ./hyprpaper.nix
    ./wlogout.nix
    ./hyprlock.nix
    ./hypridle.nix
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
  };

  programs.ironbar = {
    enable = true;
  };
  
}
