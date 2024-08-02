{
  description = "NixOS Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plasma manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , plasma-manager
    , ...
    } @ inputs:
    let
      # Define the system type here
      system = "x86_64-linux";
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations.kurue-dell = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        #  Our main nixos configuration file 
        modules = [ ./dell/configuration.nix ];
      };
    };
}
