{
  description = "My Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, stylix, home-manager, ... } @ inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in

  {
    nixosConfigurations.fraKctured = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/fraKctured/configuration.nix
	      stylix.nixosModules.stylix
      ];
    };
    homeConfigurations.jazz = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home/jazz.nix
      ];
    };
  };
}
