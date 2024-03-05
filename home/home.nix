{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./themes
    ./fonts
    ./editors/helix
    ./terminal
    ./wayland/waybar/default.nix
  ];

  home = {
    username = "krisz";
    homeDirectory = "/home/krisz";

    stateVersion = "23.11"; # Please read the comment before changing.

    packages = with pkgs; [
      btop
      neovim
      neofetch
      kitty
      hyprpaper
      wofi
      zathura

      xz
      wezterm
    ];

    file = {
    };
  };

  services = {
    dunst.enable = true;

    gpg-agent = {
      enable = true;
      pinentryFlavor = "gnome3";
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  programs.home-manager.enable = true;
}
