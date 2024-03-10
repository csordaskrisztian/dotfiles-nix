{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./themes
    ./editors/helix
    ./terminal
    ./wayland
  ];

  news.display = "show";

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

      gnome.dconf-editor
    ];

    file = {
    };
  };

  services = {
    # dunst.enable = true;

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
