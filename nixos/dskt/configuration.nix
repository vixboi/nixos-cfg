{ config, pkgs, ... }:

{
  imports =
    [
      ./dskt/hardware-configuration.nix
      ./dskt/applications.nix
      ./dskt/system.nix
      ./dskt/boot.nix
      ./dskt/users.nix
    ];

}

