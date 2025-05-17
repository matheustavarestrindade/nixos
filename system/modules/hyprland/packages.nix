{
	config,
	pkgs,
	...
}: {
	environment.systemPackages = with pkgs; [
		# Notification
		libnotify
		# Terminal
		kitty
		#File Manager
		dolphin
		# Menu
        rofi
		# Wallpaper
		hyprpaper
		# Brightness Control
		brightnessctl
		# Media Key Control
		playerctl

		# Dependencies for Hyprland
		qt5.qtwayland
		qt6.qtwayland

		# Wayland clipboard (Copy/Paste)
		wl-clipboard

		wlogout
	];
}
