{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./applications.nix
      ./system.nix
      ./boot.nix
      ./users.nix
    ];

}

