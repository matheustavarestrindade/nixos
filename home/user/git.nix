{pkgs, ...}:
let
	userName = "matheustrindade";
	email = "matheustavarestrindade@hotmail.com";
in 
{
	programs.git = {
		enable = true;
		userName = userName;
		userEmail = email;
	};

	programs.gh = {
		enable = true;
		gitCredentialHelper = {
			enable = true;
		};
	};
}
