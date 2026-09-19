{ config, pkgs, ... }:

{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernel.sysctl = {
  "vm.max_map_count" = 2147483642;
  };

}
