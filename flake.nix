{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		# hyprland.url = "github:hyprwm/Hyprland";


		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs,  nixpkgs-unstable, home-manager, ... }@inputs: 
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
		pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in
	{
		nixosConfigurations.matheus = lib.nixosSystem {
			inherit system;
			modules = [
				./system/configuration.nix
			];

			specialArgs = {
				inherit pkgs-unstable;
				inherit inputs;
			};
		};

		homeConfigurations = {
			matheus = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home ];
				extraSpecialArgs = {
					inherit inputs;
					inherit pkgs-unstable;
				};
			};
		};

	};
}
