#BIOS Laptop
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
    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "laptop";
  powerManagement.enable = true;
    
}
