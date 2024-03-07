{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./themes
    # ./fonts
    ./editors/helix
    ./terminal
    ./wayland
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
      zathura
      termusic
      pavucontrol

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
      pinentryFlavor = "curses";
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  programs.home-manager.enable = true;
}
