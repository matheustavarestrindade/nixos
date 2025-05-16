{ config, ... }:
let 
    configDir = ../configs;
in
{
	home.file = {
		# ".config/hypr".source = "${configDir}/hypr";
		# ".config/swaylock".source = "${configDir}/swaylock";
		# ".config/swayidle".source = "${configDir}/swayidle";
	};
}
