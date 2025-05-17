{
	config,
	pkgs,
	inputs,
	...
}: let
	# ----- Configuration Variables ----- #
	myTerminal = "kitty"; # Your preferred terminal: Kitty

	# Font settings
	primaryFontFamily = "Fira Code Regular"; # Or your "Firecuda" font
	iconFontFamily = "Font Awesome 6 Free Regular"; # Adjust if using a different FA version/name
	fontSize = "12";
	fullFontString = "${primaryFontFamily} ${fontSize}, ${iconFontFamily} ${fontSize}";

	rofiModes = "drun,run,window";
	theme = "spotlight-dark";
in {
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland;
		theme = ./rofi-themes/${theme}.rasi;

		extraConfig = {
			modi = rofiModes;
			font = fullFontString;
			show-icons = true;
			disable-history = true;
			hover-select = true;
			bw = 0;
			display-drun = "";
			display-window = "";
			display-combi = "";
			icon-theme = "Fluent-dark";
			terminal = myTerminal;
			drun-match-fields = "name";
			drun-display-format = "{name}";
			me-select-entry = "";
			me-accept-entry = "MousePrimary";
			kb-cancel = "Escape,MouseMiddle";
		};
	};
}
