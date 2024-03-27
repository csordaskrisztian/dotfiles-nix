{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./themes
    ./editors/helix
    ./editors/nixvim
    ./terminal
    ./wayland
    ./software
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
    kdeconnect.enable = true;
  };
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit.Description = "polkit-gnome-authentication-agent-1";

    Install = {
      WantedBy = ["graphical-session.target"];
      Wants = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  programs.ags.enable = true;

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    BROWSER = "librewolf";
    TERMINAL = "alacritty";
    NIX_AUTO_RUN = "1";

    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER = "vulkan";
  };

  programs.home-manager.enable = true;
}
