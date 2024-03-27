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
      supportedFilesystems = ["ext4"];
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [nixos-bgrt-plymouth];
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["amdgpu"];

    tmp.cleanOnBoot = true;
  };

  networking.hostName = "desktop";
  zramSwap.enable = true;
  services.fstrim.enable = true;

  programs.steam = {
    enable = true;

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
  programs.gamemode.enable = true;

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
