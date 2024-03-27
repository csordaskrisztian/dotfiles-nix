{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./fonts
    inputs.home-manager.nixosModules.default
    inputs.hyprland.nixosModules.default
  ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Budapest";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    # font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      xkb.layout = "hu";
    };
    dbus.implementation = "broker";
    blueman.enable = true;
    dbus.packages = with pkgs; [
      gcr
      gnome.gnome-settings-daemon
    ];
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    accounts-daemon.enable = true;

    greetd = let
      hyprsession = {
        command = "${lib.getExe config.programs.hyprland.package}";
        user = "krisz";
      };
    in {
      enable = true;
      settings = {
        default_session = hyprsession;
        initail_session = hyprsession;
        terminal.vt = 1;
      };
    };
  };

  security = {
    pam.services.greetd.enableGnomeKeyring = true;
    # polkit.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  programs = {
    hyprland = {
      enable = true;
      # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
    zsh.enable = true;
    dconf.enable = true;
    kdeconnect.enable = true;
    seahorse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      warn-dirty = false;
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;

      trusted-users = ["root" "@wheel"];

      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://helix.cachix.org"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://anyrun.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Experimental = true;
    };
  };
  # powerManagement.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.krisz = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    home-manager
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
