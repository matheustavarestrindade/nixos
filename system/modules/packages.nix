{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		btop
		git
		lm_sensors
		neofetch
		neovim
		ripgrep
		unzip
		openssl
		openssl.dev
		wget
		xfce.thunar
		xdg-desktop-portal-gtk
		xdg-desktop-portal-wlr
		zip
		lshw

        #Compiler
        gcc
        gnumake


		home-manager
	];
}
