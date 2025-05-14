{ config, inputs, lib, pkgs, ...}:
let

hypr-pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};

in {
	hardware.graphics = {
		enable = true;
	};

	services.xserver.videoDrivers = ["nvidia"];

	hardware = {
	
		nvidia = {
			modesetting.enable = true;

			powerManagement.enable = false;
			powerManagement.finegrained = false;

			open = false;
			nvidiaSettings = true;
			package = config.boot.kernelPackages.nvidiaPackages.stable;

			prime = {
				nvidiaBusId = "PCI:01:0:0";
				amdgpuBusId = "PCI:05:0:0";
			};
		};
		# graphics = {
		# 	package = hypr-pkgs-unstable.mesa.drivers;
		# 	# driSupport32Bit  = true;
		# 	package32 = hypr-pkgs-unstable.pkgsi686Linux.mesa.drivers;
		# };
	};


	#Hyperland specifics
	environment.systemPackages = with pkgs; [
		egl-wayland
	];

}
