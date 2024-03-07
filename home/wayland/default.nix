{ inputs,pkgs,...}: {

  imports = [
    ./hyprland
    ./waybar
    ./hyprpaper.nix
    # ./wlogout.nix
  ];
  
  home = {
    packages = with pkgs; [
      wl-clipboard
      hyprpaper
      wofi
      wlogout
    ];
  };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  # };
  
}
