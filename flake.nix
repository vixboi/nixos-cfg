{
  description = "main system flake";

  inputs = {
   nixpkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.zst";

   nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

   aerothemeplasma-nix = {
      url = "github:nyakase/aerothemeplasma-nix/26.05";
      inputs.nixpkgs.follows = "nixpkgs";
   };

  };
  outputs = { self, nixpkgs, nixpkgs-unstable, aerothemeplasma-nix }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
	allowUnfree = true;
      };
    };

  in
  { 

  nixosConfigurations = {
   dskt = nixpkgs.lib.nixosSystem {
     specialArgs = {
      inherit system; 
      unstablePkgs = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
       };
      };
     
     modules = [
     ./nixos/dskt/configuration.nix
     aerothemeplasma-nix.nixosModules.aerothemeplasma-nix
     ];
    };
   

   lptp = nixpkgs.lib.nixosSystem {
     specialArgs = {inherit system; };
     
     modules = [
     ./nixos/lptp/configuration.nix
     aerothemeplasma-nix.nixosModules.aerothemeplasma-nix
     ];
    };
   

   };
 };
}