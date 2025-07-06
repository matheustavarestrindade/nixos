{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		btop
		git
		lm_sensors
		neofetch
		neovim
		ripgrep
        fd
        screen
		unzip
		openssl
		openssl.dev
		wget
		xfce.thunar
		xdg-desktop-portal-gtk
		xdg-desktop-portal-wlr
		zip
		lshw
        libGLU
        mesa

        #Compiler
        gcc
        gnumake

        # Office
        libreoffice


        nix
		home-manager
	];
}
