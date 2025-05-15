{
	home.sessionVariables = {
		BROWSER = "google-chrome-stable";
		EDITOR = "nvim";
		TERMINAL = "kitty";
		NIXOS_OZONE_WL = "1";
		MOZ_ENABLE_WAYLAND = "1";
		SDL_VIDEODRIVER = "wayland";
		QT_QPA_PLATFORM = "wayland-egl";
		QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
		QT_AUTO_SCREEN_SCALE_FACTOR = "1";
		GTK_CSD = "0";
		WLR_DRM_DEVICES = "/dev/dri/card0";
		WLR_NO_HARDWARE_CURSORS = "1"; 
		CLUTTER_BACKEND = "wayland";
		XCURSOR_SIZE = "32";
		# NVIDIA OPTIONS
		# __NV_PRIME_RENDER_OFFLOAD= "1";
		# __GLX_VENDOR_LIBRARY_NAME="nvidia";
	};


	# Needs this to source envs ??
	programs.bash = {
		enable = true;
	};

}
