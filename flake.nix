{
  description = "My Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # Home manager stuffs
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sops-nix
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @ inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in

  {
    nixosConfigurations = {
      fraKctured = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./fraKctured/configuration.nix
          inputs.sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.jazz = import ./fraKctured/home;
              extraSpecialArgs = {
                inherit inputs;
              };
            };
          }
        ];
      };
      # Add more users here:

    };
  };
}
