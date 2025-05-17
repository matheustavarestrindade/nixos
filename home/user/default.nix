{
	imports = [
		./config.nix
		./git.nix
		./packages.nix
		./browser.nix
		./environment.nix
        ./hyprland
	];

	nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);

			permittedInsecurePackages = [
				
			];
		};
	};
}
