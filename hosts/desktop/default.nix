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
    supportedFilesystems = ["ntfs" "ext4"];
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

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer
      ];
    };
    cpu.intel.updateMicrocode = true;
  };
}
