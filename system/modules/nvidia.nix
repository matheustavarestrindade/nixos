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
				# sync.enable = true;
				# offload.enable = true;
				# offload.enableOffloadCmd = true;
				nvidiaBusId = "PCI:01:0:0";
				amdgpuBusId = "PCI:05:0:0";
			};
		};
	};


	#Hyperland specifics
	environment.systemPackages = with pkgs; [
		egl-wayland
	];

}
