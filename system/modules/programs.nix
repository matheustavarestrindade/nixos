{ config, pkgs, inputs, ... }:

{
	xdg.portal = {
		enable = true;
		wlr.enable = false;
		xdgOpenUsePortal = false;
		extraPortals = [
			#pkgs.xdg-desktop-portal-hyprland
			#pkgs.xdg-desktop-portal-gtk
		];
	};

	programs = {
        nix-ld = {
            enable = true;
        };
		hyprland = {
			# package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
			# portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

			enable = true;
			
			xwayland = {
				enable = true;
			};
			
		};

	};
}
