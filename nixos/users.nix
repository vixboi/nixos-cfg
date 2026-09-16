{ config, pkgs, ... }:

{

  environment.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/system/#dskt";
  };

  users.users."vix" = {
    isNormalUser = true;
    description = "ali";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

}
