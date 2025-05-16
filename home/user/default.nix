{
	imports = [
		./config.nix
		./git.nix
		./packages.nix
		./browser.nix
		./environment.nix
        ./waybar.nix
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
