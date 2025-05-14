{
	home.sessionVariables = {
		BROWSER = "google-chrome";
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
		WLR_RENDERER = "vulkan";
		XCURSOR_SIZE = "32";
	};


	# Needs this to source envs ??
	programs.bash = {
		enable = true;
	};

}
