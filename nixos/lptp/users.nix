{ config, pkgs, ... }:

{

  environment.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/system/#lptp";
  };

  users.users."ali" = {
    isNormalUser = true;
    description = "ali";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      
    ];
  };

    users.users."laptop" = {
    isNormalUser = true;
    description = "laptop";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      pkgs.vscodium
      pkgs.git
    ];
  };


}
