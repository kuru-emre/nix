{
  description = "NixOS Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plasma manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ...} @ inputs:
    let
      inherit (self) outputs;
    in {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        kurue-dell = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          # > Our main nixos configuration file <
          modules = [./hosts/dell/configuration.nix];
        };

        kurue-lenovo = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          # > Our main nixos configuration file <
          modules = [./hosts/lenovo/configuration.nix];
        };
      };
    };
}

