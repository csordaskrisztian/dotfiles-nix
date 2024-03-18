#UEFI Desktop
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../nixos
    ./hardware-configuration.nix
  ];

  boot = {
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4" "ntfs"];
    };
    # supportedFilesystems = ["ntfs" "ext4"];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      # theme = "connect";
      # themePackages = with pkgs; [(
      #   adi1090x-plymouth-themes.override {
      #     selected_themes = [ "connect" ];
      #   }
      # )];
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["amdgpu"];
  };

  networking.hostName = "desktop";
  zramSwap.enable = true;
  services.fstrim.enable = true;

  programs.steam = {
    enable = true;
    # fix gamescope inside steam
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          keyutils
          libkrb5
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
        ];
    };
  };

  qt = {
    enable = false;
    platformTheme = "gtk2";
    style = "gtk2";
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
        # vulkan-loader
        # vulkan-validation-layers
        # vulkan-extension-layer
      ];
    };
  };
}
