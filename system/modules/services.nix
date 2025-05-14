{ config, pkgs, ... }:

{
	services = {
		dbus.enable = true;
		openssh.enable = true;
		# Configure keymap in X11
		xserver = {
			displayManager.sddm = {
				enable = true;
				# settings = {
				# 	General.DisplayServer = "x11-user";
				# };
				wayland.enable = true;
			};
			xkb = {
				layout = "br";
				variant = "nodeadkeys";
			};

		};

		displayManager = {
			enable = true;
			sddm = {
				enable = true;
				wayland = {
					enable = true;
					# theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
				};
			};
		};
	};
}
