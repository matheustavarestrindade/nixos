{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		btop
		git
		lm_sensors
		libsForQt5.qt5.qtquickcontrols2
		libsForQt5.qt5.qtgraphicaleffects
		libsForQt5.qt5.qtsvg
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


		home-manager
	];
}
