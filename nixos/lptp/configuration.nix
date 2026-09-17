{ config, pkgs, ... }:

{
  imports =
    [
      ./lptp/hardware-configuration.nix
      ./lptp/applications.nix
      ./lptp/system.nix
      ./lptp/boot.nix
      ./lptp/users.nix
    ];

}

