{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		(pkgs.callPackage ./sddm-themes/sddm-astronaut-theme.nix {
			theme = "astronaut";
			customBackground=./sddm-themes/wallpapers/spinning-structure.mp4;
			themeConfig = {
				General = {
					PartialBlur = "false";
				};
			};
		})
	];

	services = {
		dbus.enable = true;
		openssh.enable = true;

		# Configure keymap in X11
		xserver = {
			displayManager.sddm = {
				enable = true;
				wayland.enable = true;
				package = pkgs.kdePackages.sddm;
				theme = "sddm-astronaut-theme";
				extraPackages = with pkgs; [
					kdePackages.qtmultimedia
					kdePackages.qtsvg
					kdePackages.qtvirtualkeyboard
				];
			};
			xkb = {
				layout = "br";
				variant = "nodeadkeys";
			};

		};

		# displayManager = {
		# 	enable = true;
		# 	sddm = {
		# 		enable = true;
		# 		wayland = {
		# 			enable = true;
		# 		};
		# 	};
		# };
	};
}
