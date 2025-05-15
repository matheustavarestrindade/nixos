{ config, ... }:
let 
    configDir = ../configs;
in
{
	home.file = {
		# ".config/hypr".source = "${configDir}/hypr";
		# ".config/swaylock".source = "${configDir}/swaylock";
		# ".config/swayidle".source = "${configDir}/swayidle";


    
        # Create a link so it dont go to nix-store and it can be editable by Lazy        
		".config/nvim".source = config.lib.file.mkOutOfStoreSymlink"${configDir}/nvim";
	};
}
