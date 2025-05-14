{ pkgs, ... }:

let 
	homeManagerSessionVars = "/home/$USER/.nix-profile/etc/profile.d/hm-session-vars.sh";
in {
	environment.extraInit = "[[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars}";
}
