{ config, pkgs, ... }:

{
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "i915.enable_dpcd_backlight=3" ];
  boot.plymouth.enable = true;

}