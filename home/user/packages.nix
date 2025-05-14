{ pkgs, pkgs-unstable, ...}:

{
	home.packages = [
		# Dev
		pkgs.go
		pkgs.lua
		pkgs.nodejs_23
		
		# Work

		# Bluetooth
		pkgs.blueberry


		#Utils
		pkgs.catppuccin-cursors.macchiatoBlue
		pkgs.catppuccin-gtk
		pkgs.papirus-folders
	];
}

