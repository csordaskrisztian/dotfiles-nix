{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./themes
    ./editors/helix
    ./editors/nixvim
    ./terminal
    ./wayland
    inputs.ags.homeManagerModules.default
  ];

  news.display = "show";

  home = {
    username = "krisz";
    homeDirectory = "/home/krisz";

    stateVersion = "23.11"; # Please read the comment before changing.

    packages = with pkgs; [
      btop
      neofetch
      kitty
      zathura
      termusic
      pavucontrol
      librewolf
      xfce.thunar
      xfce.thunar-archive-plugin
      mpv
      xz
      prismlauncher
      nixos-icons
      gnome.dconf-editor
      gnome.file-roller
      loupe
      playerctl
      xfce.tumbler
      imagemagick
      mangohud
      gamescope
    ];
  };

  services = {
    gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };

  programs.ags.enable = true;

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";

    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.home-manager.enable = true;
}
