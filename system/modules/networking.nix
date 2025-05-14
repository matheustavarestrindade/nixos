{ config, pkgs, ... }:

{
	networking = {
		hostName = "matheus";
		networkmanager.enable = true;
		enableIPv6 = false;
		firewall.enable = false;
	};
}
