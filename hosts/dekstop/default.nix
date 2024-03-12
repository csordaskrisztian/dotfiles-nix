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
    plymouth.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["amdgpu"];
  };

  networking.hostName = "desktop";
  zramSwap.enable = true;
  services.fstrim.enable = true;
}
