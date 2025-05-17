{
	config,
	pkgs,
	pkgs-unstable,
	lib,
	inputs,
	...
}: {
	imports = [
		./user
	];

	wayland.windowManager.hyprland.systemd.variables = ["--all"];

	home.username = "matheus";
	home.homeDirectory = "/home/matheus";
	home.stateVersion = "24.11";
}
