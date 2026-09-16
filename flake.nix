{
  description = "main system flake";

  inputs = {
   nixpkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.zst";
  aerothemeplasma-nix = {
      url = "github:nyakase/aerothemeplasma-nix/26.05";
      inputs.nixpkgs.follows = "nixpkgs";

   };
  };
  outputs = { self, nixpkgs, aerothemeplasma-nix }:
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
     specialArgs = {inherit system pkgs; };
     
     modules = [
     ./nixos/configuration.nix
     aerothemeplasma-nix.nixosModules.aerothemeplasma-nix
     ];
    };
   };

   };
}
